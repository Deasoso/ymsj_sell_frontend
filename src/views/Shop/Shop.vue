<template>
  <div>
    <section class="is-cover allheight backpic">
      <!-- <nav class="level gemhead" style="margin-bottom: 4px;">
        <div class="level-left"></div>
        <div class="level-right">
          <p class="level-item mygem whiteborder">
            我的宝石：10000
          </p>
        </div>
      </nav>
      <nav class="level buyhead" style="margin-bottom: 4px;">
        <div class="level-left"></div>
        <div class="level-right">
          <div class="goldbuttonback" @click="buymodalactive=true">
            <img class="gemicon" src="http://ymsjimg.deaso40.com/shop_slices/宝石15.png">
            <a class="goldbuttontext">购买宝石</a>
          </div>
        </div>
      </nav> -->
      <div class="textback">
        <div class="titlepos whiteborder" style="display:relative;">
          <div class="titletext">{{$t('卡牌召唤')}}</div>
        </div>
        <div class="subtitlepos whiteborder">
          <img class="treasurebox" src="http://ymsjimg.deaso40.com/shop_slices/treasurebox.png">
        </div>
        <div class="intextpos">
          <nav class="level buybuttons"><!-- 有level，按钮垂直居中 -->
            <div class="buybuttonback" @click="draw(1)">
              <img class="buygemicon" src="http://ymsjimg.deaso40.com/shop_slices/宝石15.png">
              <a class="buybuttonvalue">0.010</a>
              <a class="buybuttontext">{{$t('单次召唤')}}</a>
            </div>
            <div class="buybuttonback" @click="draw(10)">
              <img class="buygemicon" src="http://ymsjimg.deaso40.com/shop_slices/宝石15.png">
              <a class="buybuttonvalue">0.100</a>
              <a class="buybuttontext">{{$t('十连召唤')}}</a>
            </div>
          </nav>
        </div>
      </div>
      <nav class="level loadinghead" v-if="$store.state.searchCardTimer">
        <div class="level-left"></div>
        <div class="level-right">
          <div class="loading"></div>
          <p class="level-item mygem whiteborder">
            {{loadingtext}}
          </p>
        </div>
      </nav>
      <!-- <img class="fairy" src="http://ymsjimg.deaso40.com/shop_slices/fair.png"> -->
    </section>
    <buy-modal :buymodalactive.sync="buymodalactive" />
    <draw-modal
      v-for="(item,index) in newcards"
      :key="index"
      :modalactive.sync="cardwindowshow[index]"
      :drawedcards="newcards[index]" />
  </div>
</template>

<script>
import nft_abi from '@/contracts/NFT_abi.json'
import DrawModal from './DrawModal'
import BuyModal from './BuyModal'

export default {
  data () {
    return {
      modalactive: true,
      buymodalactive: false,
      ymsjvalue: 0,
      nftid: '',
      newcards: [],
      cardwindowshow: [],
      loadingtext: this.$t('抽卡中...')
    }
  },
  components: {
    DrawModal,
    BuyModal
  },
  computed: {
    web3 () {
      return this.$store.state.web3
    },
    contract () {
      const contract_in = this.web3.web3Instance().eth.contract(nft_abi)
      return contract_in.at(this.Global.contract_address)
    }
  },
  methods: {
    openModal () {
      this.modalactive = true
    },
    async draw (times) {
      if (!this.$store.state.web3.isInjected) {
        this.$buefy.dialog.alert({
          title: this.$t('用户未登录'),
          message: this.$t('请先用 Metamask 钱包登录！'),
          confirmText: this.$t('确认')
        })
        return
      }
      this.web3.web3Instance().eth.defaultAccount = this.web3.web3Instance().eth.coinbase
      var that = this
      await new Promise(
        (resolve, reject) => {
          that.contract.join(
            times,
            { value: times * 1e16 },
            function (error, result) {
              if (!error) {
                that.$buefy.dialog.alert({
                  title: this.$t('支付成功'),
                  message: this.$t('您的卡牌正在铸造，请稍后到此页面查看。在此期间请不要刷新页面。'),
                  confirmText: this.$t('确认')
                })
                that.$store.dispatch('drawCards', times)
                resolve(result)
              } else {
                that.$buefy.dialog.alert({
                  title: this.$t('支付失败'),
                  message: this.$t('用户取消了订单。'),
                  type: 'is-danger',
                  confirmText: this.$t('确认')
                })
                console.log('failed')
                that.$buefy.dialog.error(this.$t('支付失败'))
                reject(error)
              }
            })
        }
      )
    }
  },
  watch: {
    '$store.state.newCards': function (newValue, oldValue) {
      if (!newValue || newValue.length == 0) return
      for (var i = 0; i < newValue.length; i++) {
        this.cardwindowshow.push(true)
        this.newcards.push(newValue[i])
      }
      this.$store.state.newCards = []
    }
  },
  mounted () {
    console.log(this.$store.state.newCards)
    for (var i = 0; i < this.$store.state.newCards.length; i++) {
      this.cardwindowshow.push(true)
      this.newcards.push(this.$store.state.newCards[i])
    }
    this.$store.state.newCards = []
    console.log(this.newcards)
    console.log(this.cardwindowshow)
    console.log('mounted')
  }
}
</script>

<style scoped>
.backpic{
  margin-top: 80px;
  background-image: url("http://ymsjimg.deaso40.com/shop_slices/bgi8.png");
  background-size: cover;
  background-position: right;
  padding-top: 200px;
}
@media (max-width: 1920px){
  .backpic{
    background-size: auto 100%;
  }
}
.whiteborder{
  text-shadow:5px 2px 6px #000000;
  color: #ffffff
}
.allheight{
  height: 1000px;
}
.gemhead{
  padding-top: 74px;
  margin: 0 auto;
  width: calc(100vw - 400px);
}
.buyhead{
  padding-top: 14px;
  margin: 0 auto;
  width: calc(100vw - 400px);
}
.loadinghead{
  margin: 0 auto;
  margin-top: -646px;
  width: calc(100vw - 400px);
}
.mygem{
  color: #E4C46D;
  font-size: 20px;
}
.goldbuttonback{
  background-size: 100% 100%;
  background-image: url("http://ymsjimg.deaso40.com/shop_slices/button2.png");
  width: 220px;
  height: 60px;
  padding-top: 16px;
  margin: 0 auto;
  cursor: pointer;
}
.goldbuttontext{
  color: #E4C46D;
  font-size: 20px;
  font-weight: bold;
  margin-left: 8px;
}
.gemicon{
  width: 30px;
  height: 30px;
}
.textback{
  margin-left: calc(920px - (1920px - 100vw));
  width: 800px;
  height: 600px;
  background-color: #000000b3;
  border-style: outset;
  border-width: 8px;
  border-radius: 16px;
  border-color: #E7C874;
  text-align: center;
}
.titlepos{
  margin-top: 48px;
}
.subtitlepos{
  margin-top: 42px;
}
.intextpos{
  margin-top: 64px;
}
.titletext{
  font-size: 48px;
  color: #E7C874;
}
.intext{
  color: #ffffff;
  font-size: 14px;
  padding-left: 24px;
  padding-right: 24px;
}
.treasurebox{
  width: 240px;
  height: 242px;
}
.buybuttons{
  margin-left: 85px;
  margin-right: 85px;
}
.buybuttonback{
  margin-left: 109px;
  background-size: 100% 100%;
  background-image: url("http://ymsjimg.deaso40.com/shop_slices/button1.png");
  width: 268px;
  height: 60px;
  padding-top: 16px;
  margin: 0 auto;
  cursor: pointer;
}
.buygemicon{
  width: 30px;
  height: 30px;
}
.buybuttonvalue{
  color: #773F05;
  font-size: 20px;
  font-weight: bold;
  margin-left: 4px;
  padding-top: 100px;
}
.buybuttontext{
  color: #773F05;
  font-size: 20px;
  font-weight: bold;
  margin-left: 36px;
}
.fairy{
  margin-left: calc(-790px - (1920px - 100vw));
  margin-top: -587px;
  overflow: hidden;
  height: 781px;
  width: 1125px;
  max-width: 1125px;
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
</style>
