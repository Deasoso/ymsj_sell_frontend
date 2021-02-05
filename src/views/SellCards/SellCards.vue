<template>
  <div>
    <section class="is-cover allheight backpic">
      <!-- Main container -->
      <nav class="level sellhead" style="margin-bottom: 4px;">
        <!-- Left side -->
        <div class="level-left">
          <b-dropdown aria-role="list">
            <template #trigger="{ active }">
              <button class="button allgoods">
                <span style="margin-right: 12px;">全部商品</span>
                <span class="icon is-small">
                  <img src="../../assets/sellcards_slices/paixu.png" />
                </span>
              </button>
            </template>
            <b-dropdown-item aria-role="listitem">Action</b-dropdown-item>
            <b-dropdown-item aria-role="listitem">Another action</b-dropdown-item>
            <b-dropdown-item aria-role="listitem">Something else</b-dropdown-item>
          </b-dropdown>
        </div>

        <!-- Right side -->
        <div class="level-right">
          <div class="level-item">
            <div class="field has-addons">
              <p class="control">
                <input class="input searchinput" type="text" placeholder="输入你想搜索的商品名称">
              </p>
              <p class="control">
                <button class="button searchbutton">
                  <span class="icon searchicon">
                    <img src="../../assets/sellcards_slices/search.png" />
                  </span>
                </button>
              </p>
            </div>
          </div>
          <div class="level-item">
            <button class="button is-dark newexchange">
              <span class="icon">
                <img src="../../assets/sellcards_slices/trade.png">
              </span>
              <span>新建交易</span>
            </button>
          </div>
        </div>
      </nav>
      <div class="sellcards">
        <one-card class="onecard">
          12312
        </one-card>
        <one-card class="onecard">
          12312
        </one-card>
        <one-card class="onecard">
          12312
        </one-card>
        <one-card class="onecard">
          12312
        </one-card>
        <one-card class="onecard">
          12312
        </one-card>
      </div>
    </section>
    <b-button
      label="Launch card modal (keep scroll)"
      type="is-primary"
      size="is-medium"
      @click="modalactive = true" />
    <card-modal :modalactive.sync="modalactive" />
  </div>
</template>

<script>
import OneCard from "./OneCard";
import CardModal from './CardModal'

export default {
	data(){
		return{
      modalactive: true,
		}
  },
  components:{
    OneCard,
    CardModal
  },
  methods:{
    clickdrop(){
      this.$refs.dropbutton.classList.toggle("is-active");
      this.$refs.dropitem.classList.toggle("is-active");
    },
  }
};
</script>

<style scoped>
.backpic{
  background-image: url("../../assets/allcards_slices/bgi7.png");
  background-size: auto 100%;
  background-position: center;
  margin-top: 80px;
}
.allheight{
  height: 840px;
}
.sellhead{
  padding-top: 48px;
  margin: 0 auto;
  width: calc(100vw - 96px);
  max-width: 1376px;
  overflow: hidden;
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
</style>
