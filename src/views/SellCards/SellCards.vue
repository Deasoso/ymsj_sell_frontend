<template>
  <div>
    <section class="is-cover allheight backpic">
      <!-- Main container -->
      <nav class="level sellhead" style="margin-bottom: 4px;">
        <!-- Left side -->
        <div class="level-left">
          <b-select v-model="selectteam" style="margin-left: 12px;" @input="refreshCard">
            <option 
              v-for="data in teamoptions"
              :value="data.value"
              :key="data.value">
              {{ data.label }}
            </option>
          </b-select>
          <!-- <b-dropdown aria-role="list">
            <template #trigger="{ active }">
              <button class="button allgoods">
                <span style="margin-right: 12px;">全部商品</span>
                <span class="icon is-small">
                  <img src="http://ymsjimg.deaso40.com/sellcards_slices/paixu.png" />
                </span>
              </button>
            </template>
            <b-dropdown-item aria-role="listitem">种族筛选</b-dropdown-item>
            <b-dropdown-item aria-role="listitem">费用筛选</b-dropdown-item>
            <b-dropdown-item aria-role="listitem">功能筛选</b-dropdown-item>
          </b-dropdown> -->
        </div>

        <!-- Right side -->
        <div class="level-right">
          <div class="level-item">
            <div class="field has-addons">
              <b-autocomplete
                rounded
                v-model="searchname"
                :data="filteredDataArray"
                placeholder="输入要搜索的卡牌名称"
                clearable
                @select="option => {searchedname=option;refreshCard()}">
                <template #empty>No results found</template>
              </b-autocomplete>
              <button class="button searchbutton" @click="refreshCard">
                <span class="icon searchicon">
                  <img src="http://ymsjimg.deaso40.com/sellcards_slices/search.png" />
                </span>
              </button>
            </div>
          </div>
          <div class="level-item">
            <button class="button is-dark newexchange" @click="sellmodalactive=true">
              <span class="icon">
                <img src="http://ymsjimg.deaso40.com/sellcards_slices/trade.png">
              </span>
              <span>新建交易</span>
            </button>
          </div>
        </div>
      </nav>
      <div class="sellcards">
        <one-card v-for="(item, index) in showorders" :key="index" 
          class="onecard" @ClickBuy="ClickBuy(item)" :cardData="item">
        </one-card>
        <div v-if="transactionisall" style="margin-top: 20px;">
          没有更多内容了
        </div>
        <div v-else style="width: 100px;margin: 0 auto;margin-top:20px;">
          <div class="loading"></div>
          <div class="loadingtext">加载中</div>
        </div>
      </div>
    </section>
    <card-modal :modalactive.sync="modalactive" :cardData.sync="selectItem" />
    <sell-modal :modalactive.sync="sellmodalactive" />
    <b-loading v-model="isLoading"></b-loading>
  </div>
</template>

<script>
import OneCard from "./OneCard";
import CardModal from './CardModal'
import SellModal from './SellModal'
import orderapi from '@/util/getOrders'
import drawablecards from '@/util/constants/drawablecards'
import cardfactions from '@/util/constants/cardfactions'
import { getScrollHeight, getScrollTop, getWindowHeight } from "./screen";

export default {
	data(){
		return{
      drawablecards: drawablecards,
      modalactive: false,
      sellmodalactive: false,
      selectItem: {},
      teamoptions: [{label: '全部阵营', value: 'all'}],
      selectteam: 'all',
      searchnames: [],
      searchname: '',
      searchedname: '',
      isLoading: false,
      orders: [],
      showorders: [],
      transactionisall: false,
      searchingTransaction: false,
      transactionStart: 0
		}
  },
  computed: {
    filteredDataArray() {
      return this.searchnames.filter((option) => {
        return option
          .toString()
          .toLowerCase()
          .indexOf(this.searchname.toLowerCase()) >= 0
      })
    }
  },
  components:{
    OneCard,
    CardModal,
    SellModal
  },
  methods:{
    clickdrop(){
      this.$refs.dropbutton.classList.toggle("is-active");
      this.$refs.dropitem.classList.toggle("is-active");
    },
    ClickBuy(item){
      this.selectItem = item;
      this.modalactive = true;
    },
    loadOrders(){
      if(getScrollTop() + getWindowHeight() >= getScrollHeight() - 400){ // 360是底部和加载中的高度
        this.loadTransaction();
      }
    },
    loadTransaction(){
      if(this.transactionisall) return;
      if(this.searchingTransaction) return;
      this.searchingTransaction = true;
      setTimeout(async () => {
        await this.getTransaction();
        this.searchingTransaction = false;
        if(getScrollTop() + getWindowHeight() >= getScrollHeight() - 400){ // 360是底部和加载中的高度
          this.loadTransaction();
        }
      },1000);
    },
    async getTransaction(){
      const transactions = await orderapi.getOrders(this.transactionStart, this.transactionStart + 16, false, true, 0, 0, 0, 0);
      this.orders = this.orders.concat(transactions);
      console.log(this.transactionStart);
      console.log(transactions.length);
      this.transactionStart += transactions.length;
      if (transactions.length < 16){// 不足16个，算找完了
        this.transactionisall = true;
      }
      this.refreshCard();
    },
    getSearchNames(){
      var names = []
      drawablecards.filter(item => {
        names.push(item.name)
      })
      this.searchnames = names;
    },
    refreshOption(){
      this.teamoptions = [{label: '全部阵营', value: 'all'}];
      for(var i in drawablecards){
        if((this.teamoptions.filter(item => item.value == drawablecards[i].factions)).length <= 0){
          this.teamoptions.push({
            label: cardfactions[drawablecards[i].factions].name,
            value: drawablecards[i].factions
          })
        }
      }
    },
    refreshCard(){
      this.showorders = this.orders.filter(item => {
        if (this.searchname && this.searchname != '' && drawablecards[item.id].name.indexOf(this.searchname) == -1) return false;
        if (this.searchedname && this.searchedname != '' && drawablecards[item.id].name != this.searchedname) return false;
        if (this.selectteam != 'all' && this.selectteam != drawablecards[item.id].factions) return false;
        return true;
      })
    },
  },
  mounted(){
    this.getSearchNames();
    this.refreshOption();
    this.$nextTick(async () => { // 没有nexttick访问不到vue.properties
      this.loadTransaction();
    })
    window.addEventListener('scroll', this.loadOrders);
  },
  destroyed(){
    window.removeEventListener('scroll', this.loadOrders, false);
  },
};
</script>

<style scoped>
.backpic{
  background-image: url("http://ymsjimg.deaso40.com/allcards_slices/bgi7.png");
  background-size: 100% auto;
  background-position: center;
  background-position-y: 0;
  margin-top: 80px;
  padding-bottom: 40px;
}
.allheight{
  min-height: 840px;
}
.sellhead{
  padding-top: 48px;
  margin: 0 auto;
  width: calc(100vw - 96px);
  max-width: 1376px;
  /* overflow: hidden; */
}
.sellcards{
  margin: 0 auto;
  max-width: 1400px;
}
.onecard{
  display: inline-block;
  margin: 12px;
}
.allgoods{
  width: 120px;
  height: 40px;
}
.newexchange{
  width: 120px;
  height: 40px;
}
.searchbutton{
  height: 40px;
}
.searchinput{
  height: 40px;
  width: 240px;
}
.searchicon{
  padding-left: 4px;
  padding-right: 4px;
}
.loading {
  -webkit-animation: spinAround 500ms infinite linear;
  animation: spinAround 500ms infinite linear;
  border: 2px solid #773F05;
  border-radius: 290486px;
  border-right-color: transparent;
  border-top-color: transparent;
  content: "";
  display: block;
  height: 1em;
  position: relative;
  width: 1em;
  margin-right: 8px;
}
.loadingtext{
  margin-top: -19px;
}
</style>
