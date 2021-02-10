<template>
  <div>
    <section class="is-cover allheight backpic">
      <nav class="level sharehead" style="margin-bottom: 4px;">
        <div class="level-left">
          <!-- 左边没有东西 -->
        </div>
        <div class="level-right">
          <b-button type="is-dark" inverted outlined class="sharebutton" style="border-color: #B2B2B2;color: #000000;">
            <img class="shareicon" src="../../assets/shop_slices/share.png">
            <span>分享主页</span>
          </b-button>
        </div>
      </nav>
      <img class="avatarimg" src="../../assets/title_slices/bgi1.png">
      <div class="username">
        {{web3.coinbase || '无名'}}
      </div>
      <nav class="level haveheader" style="margin-bottom: 8px;">
        <div class="level-left">
          <img class="goodslogo" src="../../assets/mine_slices/card.png">
          拥有的卡牌
        </div>
        <div class="level-right" @click="$router.push('/Backpack')">
          查看更多
          <img class="arrowlogo" src="../../assets/allcards_slices/goto.png">
        </div>
      </nav>
      <div class="teamcards">
        <a v-for="(item, index) in showcards" :key="index">
          <img v-if="index==0" class="teamcard1" @click="$router.push('/CardDetail?id='+item.id)" :src="drawablecards[item.id].url"/>
          <img v-else class="teamcard" @click="$router.push('/CardDetail?id='+item.id)" :src="drawablecards[item.id].url"/>
        </a>
      </div>
      <nav class="level haveheader" style="margin-bottom: 8px;">
        <div class="level-left">
          <img class="shoplogo" src="../../assets/mine_slices/goods.png">
          在售的商品
        </div>
        <div class="level-right" @click="$router.push('/SellCards')">
          查看更多
          <img class="arrowlogo" src="../../assets/allcards_slices/goto.png">
        </div>
      </nav>
      <div class="shopgoods">
        <div class="shopgood1">
          <img class="shopcard" src="../../assets/cards/01联会禁音使.png">
          <a class="button pricebutton" @click="$router.push('/CardDetail')">
            <img class="priceicon" src="../../assets/sellcards_slices/编组.png">
            <span class="price">
              3.238
            </span>
          </a>
        </div>
        <div class="shopgood">
          <img class="shopcard" src="../../assets/cards/01联会禁音使.png">
          <a class="button pricebutton" @click="$router.push('/CardDetail')">
            <img class="priceicon" src="../../assets/sellcards_slices/编组.png">
            <span class="price">
              3.238
            </span>
          </a>
        </div>
        <div class="shopgood">
          <img class="shopcard" src="../../assets/cards/01联会禁音使.png">
          <a class="button pricebutton" @click="$router.push('/CardDetail')">
            <img class="priceicon" src="../../assets/sellcards_slices/编组.png">
            <span class="price">
              3.238
            </span>
          </a>
        </div>
      </div>
      <nav class="level haveheader" style="margin-bottom: 8px;">
        <div class="level-left">
          <img class="shoplogo" src="../../assets/mine_slices/exchange.png">
          交易记录
        </div>
      </nav>
      <div class="exchangestage">
        <vue-scroll>
          <b-table :data="data" :columns="columns"></b-table>
        </vue-scroll>
      </div>
    </section>
  </div>
</template>
<script>
import usercards from '@/assets/fakedatas/usercards';
import drawablecards from '@/util/drawablecards';

export default {
  name: 'mine',
  data(){
    return{
      data: [
        { 'id': 1, 'first_name': 'Jesse', 'last_name': 'Simmons', 'date': '2016-10-15 13:43:27', 'gender': 'Male' },
        { 'id': 2, 'first_name': 'John', 'last_name': 'Jacobs', 'date': '2016-12-15 06:00:53', 'gender': 'Male' },
        { 'id': 3, 'first_name': 'Tina', 'last_name': 'Gilbert', 'date': '2016-04-26 06:26:28', 'gender': 'Female' },
        { 'id': 4, 'first_name': 'Clarence', 'last_name': 'Flores', 'date': '2016-04-10 10:28:46', 'gender': 'Male' },
        { 'id': 5, 'first_name': 'Anne', 'last_name': 'Lee', 'date': '2016-12-06 14:38:38', 'gender': 'Female' },
        { 'id': 5, 'first_name': 'Anne', 'last_name': 'Lee', 'date': '2016-12-06 14:38:38', 'gender': 'Female' },
        { 'id': 5, 'first_name': 'Anne', 'last_name': 'Lee', 'date': '2016-12-06 14:38:38', 'gender': 'Female' },
        { 'id': 5, 'first_name': 'Anne', 'last_name': 'Lee', 'date': '2016-12-06 14:38:38', 'gender': 'Female' },
        { 'id': 5, 'first_name': 'Anne', 'last_name': 'Lee', 'date': '2016-12-06 14:38:38', 'gender': 'Female' },
        { 'id': 5, 'first_name': 'Anne', 'last_name': 'Lee', 'date': '2016-12-06 14:38:38', 'gender': 'Female' },
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
      ],
      ymsjvalue: 0,
      nftid: '',
      showcards: usercards,
      drawablecards: drawablecards
    }
  },
  computed: {
    web3(){
      return this.$store.state.web3
    },
    contract(){
      const contract_in = this.web3.web3Instance().eth.contract(nft_abi);
      return contract_in.at('0xff66f816b0bdb2de3e8f2b3af71d850fcafeae1b');
    }
  },
}
</script>

<style scoped>
.backpic{
  margin-top: 80px;
  background-image: url("../../assets/allcards_slices/bgi7.png");
  background-size: auto 100%;
  background-position: center;
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
  width: 64px;
  height: 32px;
  margin-left: 19px;
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
  overflow: scroll;
}
</style>
