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
            <div class="exchangestage">
              <vue-scroll>
                <b-table :data="data" :columns="columns"></b-table>
              </vue-scroll>
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
                      <img src="../../assets/sellcards_slices/share2.png" />
                    </span>
                  </button>
                </div>
              </nav>
              <div class="contenttext">
                {{drawablecards[showCardData.id].bgStory}}
                <!-- 这张卡片非常稀有！收藏家们赶紧看过来~~机不可失时不再来！
                这张卡片非常稀有！收藏家们赶紧看过来~~机不可失时不再来！
                这张卡片非常稀有！收藏家们赶紧看过来~~机不可失时不再来！
                这张卡片非常稀有！收藏家们赶紧看过来~~机不可失时不再来！
                这张卡片非常稀有！收藏家们赶紧看过来~~机不可失时不再来！
                这张卡片非常稀有！收藏家们赶紧看过来~~机不可失时不再来！ -->
              </div>
              <div class="justaline"></div>
              <div class="creatortext">
                创建者
              </div>
              <nav class="ownerpos" style="margin-bottom: 0px;">
                <div class="level-left">
                  <img class="ownerlogo" :src="randomavatars[parseInt(showCardData.owner) % randomavatars.length].url">
                    <div class="ownername">
                      {{showCardData.owner}}
                    </div>
                </div>
              </nav>
              <div class="justaline"></div>
              <div class="creatortext">
                拥有者
              </div>
              <nav class="ownerpos" style="margin-bottom: 0px;">
                <div class="level-left">
                  <img class="ownerlogo" :src="randomavatars[parseInt(showCardData.owner) % randomavatars.length].url">
                  <div class="ownername">
                    {{showCardData.owner}}
                  </div>
                </div>
              </nav>
              <div class="justaline"></div>
              <div class="creatortext">
                合约地址
              </div>
              <nav class="level addresspos" style="margin-bottom: 0px;">
                <div class="level-left">
                  <div class="addresstext">
                    {{Global.contract_address}}
                  </div>
                  <img class="addresslogo" src="../../assets/sellcards_slices/copy.png">
                </div>
              </nav>
              <div class="justaline"></div>
            </div>
            <div class="buystage">
              <nav class="level" style="margin-bottom: 0px;">
                <div class="level-left">
                  <img class="ethlogo" src="../../assets/sellcards_slices/编组.png">
                  <div class="ethtext">
                    {{getPrice(showCardData.price)}}
                  </div>
                </div>
              </nav>
              <button class="button buybutton" @click="buyCard">
                <span>购买该商品</span>
              </button>
            </div>
          </div>
        </article>
      </div>
    </b-modal>
  </div>
</template>

<script>
import drawablecards from '@/util/constants/drawablecards';
import randomavatars from '@/util/constants/randomavatars';
import nft_abi from "@/contracts/NFT_abi.json"

export default {
  data() {
    return {
      drawablecards: drawablecards,
      randomavatars: randomavatars,
      isCardModalActive: false,
      showCardData: {
        url: require("@/assets/cards/01联会禁音使.png"),
        id: 0,
        amount: 1,
        price: 1000000000000000000
      },
      data: [
        { 'id': 1, 'first_name': 'Jesse', 'last_name': 'Simmons', 'date': '2016-10-15 13:43:27', 'gender': 'Male' },
        { 'id': 2, 'first_name': 'John', 'last_name': 'Jacobs', 'date': '2016-12-15 06:00:53', 'gender': 'Male' },
        { 'id': 3, 'first_name': 'Tina', 'last_name': 'Gilbert', 'date': '2016-04-26 06:26:28', 'gender': 'Female' },
        { 'id': 4, 'first_name': 'Clarence', 'last_name': 'Flores', 'date': '2016-04-10 10:28:46', 'gender': 'Male' },
        { 'id': 5, 'first_name': 'Anne', 'last_name': 'Lee', 'date': '2016-12-06 14:38:38', 'gender': 'Female' },
        { 'id': 5, 'first_name': 'Anne', 'last_name': 'Lee', 'date': '2016-12-06 14:38:38', 'gender': 'Female' },
        { 'id': 5, 'first_name': 'Anne', 'last_name': 'Lee', 'date': '2016-12-06 14:38:38', 'gender': 'Female' }
      ],
      columns: [
        {
          field: 'id',
          label: 'ID',
          width: '40',
          numeric: true
        },
        {
          field: 'first_name',
          label: 'First Name',
        },
        {
          field: 'last_name',
          label: 'Last Name',
        },
        {
          field: 'date',
          label: 'Date',
          centered: true
        },
        {
          field: 'gender',
          label: 'Gender',
        }
      ]
    }
  },
  props:['modalactive', 'cardData'],
  computed: {
    web3(){
      return this.$store.state.web3;
    },
    contract(){
      const contract_in = this.web3.web3Instance().eth.contract(nft_abi);
      return contract_in.at(this.Global.contract_address);
    }
  },
  watch:{
    modalactive: function(val){
      this.isCardModalActive = val;
    },
    cardData: function(val){
      this.showCardData = val;
    }
  },
  methods: {
    cancelHandler(){
      this.isCardModalActive = false;
      this.$emit('update:modalactive', this.isCardModalActive);
    },
    getPrice(input){
      // if(input < 1e9) return '< 0.000000001';
      // if(input > 1e27) return '> 1000000000.000';
      return input / 1e18;
    },
    async buyCard(){
      this.web3.web3Instance().eth.defaultAccount = this.web3.web3Instance().eth.coinbase;
      console.log(this.contract);
      var that = this;
      await new Promise(
        (resolve, reject) => {
          that.contract.buy_card(
            that.showCardData.orderid,
            {value: this.showCardData.price},
            function(error, result){
            if(!error){
              resolve(result);
            }else{
              reject(error);
            }
          })
        }
      );
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
  overflow: scroll;
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
  overflow: scroll;
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
  overflow: scroll;
  width: 240px;
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
  overflow: scroll;
  width: 280px;
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
  /* overflow: scroll; */
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
</style>