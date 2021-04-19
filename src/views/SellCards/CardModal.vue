<template>
  <div>
    <b-modal class="modalbackpos" :active="isCardModalActive"
      :on-cancel="cancelHandler"
      :width="1232"
      scroll="keep">
      <div class="modalpos">
        <article class="media">
          <div class="leftcontent">
            <div class="cardstage">
              <img class="cardpos" :src="drawablecards[showCardData.id].url">
            </div>
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
                <b-table-column field="seller" :label="$t('买方')" width="140" centered v-slot="props">
                  <div class="table-owner-name">
                    <vue-scroll :ops="ops">
                      {{props.row.buyer}}
                    </vue-scroll>
                  </div>
                </b-table-column>
                <b-table-column field="buyer" :label="$t('卖方')" width="140" centered v-slot="props">
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
          </div>
          <div class="rightcontent">
            <div class="rightupheight">
              <nav class="level" style="margin-bottom: 0px;">
                <div class="level-left titletext">
                  {{drawablecards[showCardData.id].name}}
                  <span style="font-size: 16px;margin-top: 16px;">
                    x{{showCardData.amount}}
                  </span>
                </div>
                <div class="level-right">
                  <button class="button sharebutton">
                    <span class="shareicon">
                      <img src="http://ymsjimg.deaso40.com/sellcards_slices/share2.png" />
                    </span>
                  </button>
                </div>
              </nav>
              <div class="contenttext">
                <vue-scroll>
                  {{drawablecards[showCardData.id].bgStory}}
                </vue-scroll>
              </div>
              <div class="justaline"></div>
              <div class="creatortext">{{$t('创建者')}}</div>
              <nav class="ownerpos" style="margin-bottom: 0px;">
                <div class="level-left">
                  <img class="ownerlogo" :src="randomavatars[parseInt('0x8c01d8cd287470a4597d4b10cd4c5c7dbe711125') % randomavatars.length].url">
                    <div class="ownername">
                      <vue-scroll>
                        {{showCardData.owner}}
                      </vue-scroll>
                    </div>
                </div>
              </nav>
              <div class="justaline"></div>
              <div class="creatortext">{{$t('拥有者')}}</div>
              <nav class="ownerpos" style="margin-bottom: 0px;">
                <div class="level-left">
                  <img class="ownerlogo" :src="randomavatars[parseInt(showCardData.owner) % randomavatars.length].url">
                  <div class="ownername">
                    <vue-scroll>
                      {{showCardData.owner}}
                    </vue-scroll>
                  </div>
                </div>
              </nav>
              <div class="justaline"></div>
              <div class="creatortext">{{$t('合约地址')}}</div>
              <nav class="level addresspos" style="margin-bottom: 0px;">
                <div class="level-left">
                  <div class="addresstext">
                    <vue-scroll>
                      {{Global.contract_address}}
                    </vue-scroll>
                  </div>
                  <img class="addresslogo" src="http://ymsjimg.deaso40.com/sellcards_slices/copy.png">
                </div>
              </nav>
              <div class="justaline"></div>
            </div>
            <div class="buystage">
              <nav class="level" style="margin-bottom: 0px;">
                <div class="level-left">
                  <img class="ethlogo" src="http://ymsjimg.deaso40.com/sellcards_slices/编组.png">
                  <div class="ethtext">
                    {{getPrice(showCardData.price)}}
                  </div>
                </div>
              </nav>
              <button class="button buybutton" @click="buyCard">
                <span>{{$t('购买该商品')}}</span>
              </button>
            </div>
          </div>
        </article>
      </div>
    </b-modal>
  </div>
</template>

<script>
import drawablecards from '@/util/constants/drawablecards'
import randomavatars from '@/util/constants/randomavatars'
import nft_abi from '@/contracts/NFT_abi.json'
import orderapi from '@/util/getOrders'

export default {
  data () {
    return {
      drawablecards: drawablecards,
      randomavatars: randomavatars,
      isCardModalActive: false,
      showCardData: {
        url: 'http://ymsjimg.deaso40.com/cards/01联会禁音使.png',
        owner: 1,
        id: 0,
        amount: 1,
        price: 1000000000000000000
      },
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
  props: ['modalactive', 'cardData'],
  computed: {
    web3 () {
      return this.$store.state.web3
    },
    contract () {
      const contract_in = this.web3.web3Instance().eth.contract(nft_abi)
      return contract_in.at(this.Global.contract_address)
    }
  },
  watch: {
    modalactive: function (val) {
      if (val == true) {
        this.transactionisall = false
        this.showtransactions = []
        this.transactions = []
        this.transactionStart = 0
      }
      this.isCardModalActive = val
    },
    cardData: function (val) {
      this.showCardData = val
    }
  },
  methods: {
    cancelHandler () {
      this.isCardModalActive = false
      this.$emit('update:modalactive', this.isCardModalActive)
    },
    getPrice (input) {
      // if(input < 1e9) return '< 0.000000001';
      // if(input > 1e27) return '> 1000000000.000';
      return input / 1e18
    },
    async buyCard () {
      this.web3.web3Instance().eth.defaultAccount = this.web3.web3Instance().eth.coinbase
      console.log(this.contract)
      var that = this
      await new Promise(
        (resolve, reject) => {
          that.contract.buy_card(
            that.showCardData.orderid,
            { value: this.showCardData.price },
            function (error, result) {
              if (!error) {
                resolve(result)
              } else {
                reject(error)
              }
            })
        }
      )
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
      console.log(this.showCardData.id)
      const transactionorders = await orderapi.getOrders(this.transactionStart, this.transactionStart + 16, true, false, 0, 0, this.showCardData.owner, (parseInt(this.showCardData.id) + 1))
      const transactions = await orderapi.getTransactions(transactionorders)
      this.showtransactions = this.showtransactions.concat(transactions)
      this.transactionStart += transactions.length
      if (transactions.length < 16) { // 不足16个，算找完了
        this.transactionisall = true
      }
    }
  }
}
</script>

<style scoped>
.modalbackpos{
  margin-top: 80px;
  padding-left: 48px;
  padding-right: 48px;
}
.modalpos{
  width: calc(100vw - 96px);
  max-width: 1232px;
  margin-top: 140px;
  padding-bottom: 140px;
}
.modalbackpos >>> .modal-close{
  top: 100px;
}
.leftcontent{
  width: calc(100% - 360px);
  text-align: center;
}
.cardstage{
  background-color: #f1f1f1;
  height: 476px;
  border-bottom: solid #dbdbdb 1px;
}
.cardpos{
  margin: 0 auto;
  width: 256px;
  height: 367px;
  margin-top: 48px;
}
.exchangestage{
  background-color: #ffffff;
  height: 244px;
}
.rightcontent{
  width: 360px;
  height: 720px;
  background-color: #ffffff;
  border-left: solid #dbdbdb 1px;
  padding: 16px;
}
.titletext{
  font-size: 36px;
  font-weight: bold;
  color: #333333;
}
.sharebutton{
  padding: 6px 8px;
}
.shareicon{
  width: 20px;
  height: 20px;
}
.contenttext{
  color: #888888;
  font-size: 14px;
  margin-top: 8px;
  height: 120px;
}
.justaline{
  margin-top: 8px;
  width: 328px;
  height: 1px;
  border-top: solid #DBDBDB 1px;
}
.creatortext{
  color: #B2B2B2;
  font-size: 14px;
  margin-top: 8px;
}
.ownerpos{
  margin-top: 10px;
}
.ownerlogo{
  width: 32px;
  height: 32px;
}
.ownername{
  width: 240px;
  height: 22px;
  font-size: 14px;
  font-weight: bold;
  margin-left: 8px;
}
.addresspos{
  margin-top: 8px;
}
.addresslogo{
  width: 12px;
  height: 13px;
  margin-left: 8px;
}
.addresstext{
  width: 280px;
  height: 22px;
  font-size: 14px;
  font-weight: bold;
}
.rightupheight{
  height: calc(720px - 32px - 116px);
  /* 靠这个把买的按钮挤下去 */
}
.buystage{
  border: solid #F4CF1F 1px;
  background-color: #FFFEF4;
  width: 328px;
  height: 116px;
  padding: 16px;
}
.ethlogo{
  width: 13px;
  height: 18px;
}
.ethtext{
  /* width: 280px; */
  font-size: 24px;
  font-weight: bold;
  margin-top: 4px;
  margin-left: 8px;
}
.buybutton{
  background-color: #E7CE8A;
  color: #815004;
  font-size: 14px;
  font-weight: bold;
  width: 296px;
  height: 43px;
}
.table-owner-name{
  max-width: 140px;
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
