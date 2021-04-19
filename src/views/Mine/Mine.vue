<template>
  <div>
    <section class="is-cover allheight backpic">
      <nav class="level sharehead" style="margin-bottom: 4px;">
        <div class="level-left">
          <!-- 左边没有东西 -->
        </div>
        <div class="level-right">
          <b-button type="is-dark" inverted outlined class="sharebutton"
            style="border-color: #B2B2B2;color: #000000;"
            @click="share">
            <img class="shareicon" src="http://ymsjimg.deaso40.com/shop_slices/share.png">
            <span>{{$t('分享主页')}}</span>
          </b-button>
        </div>
      </nav>
      <img class="avatarimg" :src="randomavatars[parseInt(web3.coinbase || '0') % randomavatars.length].url">
      <div class="username">
        {{web3.coinbase || this.$t('无名')}}
      </div>
      <nav class="level haveheader" style="margin-bottom: 8px;">
        <div class="level-left" style="cursor: pointer;">
          <img class="goodslogo" src="http://ymsjimg.deaso40.com/mine_slices/card.png">{{$t('拥有的卡牌')}}</div>
        <div class="level-right" @click="$router.push('/Backpack')" style="cursor: pointer;">{{$t('查看更多')}}<img class="arrowlogo" src="http://ymsjimg.deaso40.com/allcards_slices/goto.png">
        </div>
      </nav>
      <div class="teamcards">
        <a v-for="(item, index) in showcards" :key="index">
          <img :class="index==0 ? 'teamcard1' : 'teamcard'"
            @click="$router.push('/CardDetail?id='+item.id)"
            :src="drawablecards[item.id].url"/>
        </a>
      </div>
      <nav class="level haveheader" style="margin-bottom: 8px;cursor: pointer;">
        <div class="level-left">
          <img class="shoplogo" src="http://ymsjimg.deaso40.com/mine_slices/goods.png">{{$t('在售的商品')}}</div>
        <div class="level-right" @click="$router.push('/SellCards')" style="cursor: pointer;">{{$t('查看更多')}}<img class="arrowlogo" src="http://ymsjimg.deaso40.com/allcards_slices/goto.png">
        </div>
      </nav>
      <div class="shopgoods">
        <div v-for="(cardData, index) in showorders" :key="index" :class="index == 0 ? 'shopgood1' : 'shopgood'">
          <img class="shopcard" :src="drawablecards[cardData.id].url">
          <a class="button pricebutton" @click="$router.push('/SellCards')">
            <img class="priceicon" src="http://ymsjimg.deaso40.com/sellcards_slices/编组.png">
            <span class="price">
              {{getPrice(cardData.price)}}
            </span>
          </a>
        </div>
      </div>
      <nav class="level haveheader" style="margin-bottom: 8px;">
        <div class="level-left">
          <img class="shoplogo" src="http://ymsjimg.deaso40.com/mine_slices/exchange.png">
          交易记录
        </div>
      </nav>
      <div class="exchangestage"
        v-infinite-scroll="loadTransaction"
        infinite-scroll-distance="20"
        style="overflow:auto">
        <b-table :data="showtransactions">
          <b-table-column field="orderid" label="ID" width="60" centered v-slot="props">
            {{ props.row.orderid }}
          </b-table-column>
          <b-table-column field="id" :label="$t('名称')" centered v-slot="props">
            {{drawablecards[props.row.id].name}}
          </b-table-column>
          <b-table-column field="seller" :label="$t('买方')" centered v-slot="props">
            <div class="table-owner-name">
              <vue-scroll :ops="ops">
                {{props.row.buyer}}
              </vue-scroll>
            </div>
          </b-table-column>
          <b-table-column field="buyer" :label="$t('卖方')" centered v-slot="props">
            <div class="table-owner-name">
              <vue-scroll :ops="ops">
                {{props.row.seller}}
              </vue-scroll>
            </div>
          </b-table-column>
          <b-table-column field="amount" :label="$t('数量')" centered v-slot="props">
            {{ props.row.amount }}
          </b-table-column>
          <b-table-column field="price" :label="$t('价格')" centered v-slot="props">
            {{ props.row.price / 1e18 }}
          </b-table-column>
        </b-table>
        <div v-if="transactionisall">{{$t('没有更多内容了')}}</div>
        <div v-else style="width: 100px;margin: 0 auto;">
          <div class="loading"></div>
          <div class="loadingtext">{{$t('加载中')}}</div>
        </div>
      </div>
    </section>
  </div>
</template>
<script>
import drawablecards from '@/util/constants/drawablecards'
import randomavatars from '@/util/constants/randomavatars'
import orderapi from '@/util/getOrders'

export default {
  name: 'mine',
  data () {
    return {
      showcards: [],
      showorders: [],
      drawablecards: drawablecards,
      randomavatars: randomavatars,
      ops: {
        scrollPanel: {
          scrollingX: true,
          scrollingY: false
        }
      },
      showtransactions: [],
      transactions: [],
      transactionisall: false,
      searchingTransaction: false,
      transactionStart: 0
    }
  },
  watch: {
    '$store.state.cards': function (newValue, oldValue) {
      this.showcards = newValue.slice(0, 7)
    }
  },
  computed: {
    web3 () {
      return this.$store.state.web3
    }
  },
  async mounted () {
    this.$nextTick(async () => { // 没有nexttick访问不到vue.properties
      this.showcards = this.$store.state.cards.slice(0, 7)
      const orders = await orderapi.getOrders(0, 16, false, true, 0, 0, this.web3.coinbase, 0)
      this.showorders = orders.slice(0, 3)
    })
  },
  methods: {
    getPrice (input) {
      if (input < 1e15) return '< 0.001'
      if (input > 1e21) return '> 1000'
      return (input / 1e18).toFixed(3)
    },
    loadTransaction () {
      if (this.transactionisall) return
      if (this.searchingTransaction) return
      this.searchingTransaction = true
      setTimeout(async () => {
        await this.getTransaction()
        this.searchingTransaction = false
      }, 1000)
      console.log('loading...')
    },
    async getTransaction () {
      const transactionorders = await orderapi.getOrders(this.transactionStart, this.transactionStart + 16, true, false, 0, 0, this.web3.coinbase, 0)
      const transactions = await orderapi.getTransactions(transactionorders)
      this.showtransactions = this.showtransactions.concat(transactions)
      this.transactionStart += transactions.length
      if (transactions.length < 16) { // 不足16个，算找完了
        this.transactionisall = true
      }
    },
    share () {
      const _this = this
      this.$copyText(location.href).then(
        function (e) {
          _this.$buefy.dialog.alert({
            title: this.$t('已复制'),
            message: this.$t('邀请链接已复制到剪切板！'),
            confirmText: this.$t('确认')
          })
        },
        function (e) {
          _this.$buefy.dialog.alert({
            title: this.$t('复制失败'),
            message: this.$t('邀请链接复制失败，尝试手动复制？'),
            confirmText: this.$t('确认')
          })
        }
      )
    }
  }
}
</script>

<style scoped>
.backpic{
  margin-top: 80px;
  background-image: url("http://ymsjimg.deaso40.com/allcards_slices/bgi7.png");
  background-size: cover;
  background-position: center;
}
@media (max-width: 1920px){
  .backpic{
    background-size: auto 100%;
  }
}
.allheight{
  height: 1400px;
}
.sharebutton{
  font-size: 14px;
  width: 120px;
  height: 40px;
}
.shareicon{
  margin-top: 3px;
  margin-right: 5px;
  width: 16px;
  height: 16px;
}
.avatarimg{
  margin: 0 auto;
  margin-top: 24px;
  width: 128px;
  height: 128px;
  border-radius: 50%;
}
.sharehead{
  max-width: 1026px;
  margin: 0 auto;
  padding-top: 48px;
}
.username{
  margin-top: 8px;
  font-size: 20px;
  font-weight: bold;
  color: #333333;
  padding-bottom: 20px;
}
.haveheader{
  max-width: 1026px;
  margin: 0 auto;
  margin-top: 28px;
  font-size: 16px;
}
.goodslogo{
  width: 18px;
  height: 18px;
  margin-left: 8px;
  margin-right: 4px;
}
.arrowlogo{
  width: 8px;
  height: 12px;
  margin-left: 4px;
  margin-bottom: 2px;
}
.teamcards{
  background-color: #ffffff;
  border: #DBDBDB;
  border-radius: 8px;
  margin: 0 auto;
  padding: 16px;
  max-width: 1026px;
  height: 216px;
}
.teamcard1{
  width: 128px;
  height: 184px;
  display: inline-block;
}
.teamcard{
  width: 128px;
  height: 184px;
  display: inline-block;
  margin-left: 16px;
}
.shoplogo{
  width: 16px;
  height: 16px;
  padding: 1px;
  margin-bottom: 2px;
  margin-left: 8px;
  margin-right: 4px;
}
.shopgoods{
  margin: 0 auto;
  max-width: 1026px;
  height: 216px;
}
.shopgood1{
  background-color: #ffffff;
  border: #DBDBDB;
  border-radius: 8px;
  width: 326px;
  height: 213px;
  display: inline-block;
  padding: 16px;
  text-align: left;
}
.shopgood{
  background-color: #ffffff;
  border: #DBDBDB;
  border-radius: 8px;
  width: 326px;
  height: 213px;
  display: inline-block;
  padding: 16px;
  text-align: left;
  margin-left: 24px;
}
.shopcard{
  width: 128px;
  height: 180px;
  margin-left: 83px;
}
.pricebutton{
  background-color: #E7CE8A;
  width: 70px;
  height: 32px;
  margin-left: 12px;
  margin-top: 149px;
}
.priceicon{
  width: 9px;
  height: 12px;
}
.price{
  color: #815004;
  margin-top: 1px;
  font-size: 14px;
  margin-left: 4px;
}
.exchangestage{
  background-color: #ffffff;
  border-radius: 8px;
  margin: 0 auto;
  height: 430px;
  max-width: 1026px;
}
.infinite-list{
  height: 200px;
}
.table-owner-name{
  max-width: 200px;
  height: 20px;
  margin: 0 auto;
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
