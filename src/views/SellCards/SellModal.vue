<template>
  <div>
    <b-modal class="modalbackpos" :active="isCardModalActive"
      :on-cancel="cancelHandler"
      :width="480"
      scroll="keep">
      <div class="modalpos">
        <div class="upcontents">
          <div class="titletext">{{$t('新建交易')}}</div>
          <!-- <button
            type="button"
            class="delete"
            @click="cancelHandler"/> -->
          <div class="selecttext">{{$t('交易对象')}}</div>
          <b-select
            :placeholder="$t('选择交易对象')"
            class="selectpos"
            style="width: 240px;height: 40px;"
            v-model="selectedCard">
            <option
              v-for="option in $store.state.cards"
              :value="option"
              :key="option.id">
              {{drawablecards[option.id].name}}
            </option>
          </b-select>

          <div class="selecttext">{{$t('售卖数量（拥有：{amount}）', {amount: selectedCard.amount || 0})}}</div>
          <b-input :placeholder="$t('输入你想卖的数量')" class="inputwidth" v-model="amount"></b-input>

          <div class="selecttext">{{$t('商品价格（单位：ether）')}}</div>
          <b-input :placeholder="$t('输入你想卖的价格')" class="inputwidth" v-model="price"></b-input>

          <!-- <div class="selecttext">货币种类</div>
          <b-select
            placeholder="选择货币种类"
            class="selectpos"
            style="width: 240px;height: 40px;">
            <option
              v-for="option in [{'id':'1'},{'id':'2'},{'id':'3'},{'id':'4'}]"
              :value="option.id"
              :key="option.id">
              {{ option.id }}
            </option>
          </b-select> -->

          <div class="selecttext">{{$t('商品简介')}}</div>
          <b-input :placeholder="$t('输入商品简介')" class="introducewidth" v-model="introduce" type="textarea"></b-input>
        </div>

        <button class="button is-dark enterbuy" @click="sellCard">
          <span>{{$t('发布商品')}}</span>
        </button>

      </div>
    </b-modal>
  </div>
</template>

<script>
import drawablecards from '@/util/constants/drawablecards'
import nft_abi from '@/contracts/NFT_abi.json'

export default {
  data () {
    return {
      isCardModalActive: false,
      drawablecards: drawablecards,
      ops: {

      },
      amount: '',
      price: '',
      selectedCard: {},
      introduce: ''
    }
  },
  props: ['modalactive'],
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
      this.isCardModalActive = val
    }
  },
  methods: {
    cancelHandler () {
      this.isCardModalActive = false
      this.$emit('update:modalactive', this.isCardModalActive)
    },
    async sellCard () {
      this.web3.web3Instance().eth.defaultAccount = this.web3.web3Instance().eth.coinbase
      console.log(this.contract)
      var that = this
      await new Promise(
        (resolve, reject) => {
          that.contract.sell_card(
            that.selectedCard.id + 1, // 链上卡片的id为前端或后端的id+1
            that.amount,
            that.web3.web3Instance().toWei(that.price, 'ether'),
            function (error, result) {
              if (!error) {
                resolve(result)
              } else {
                reject(error)
              }
            })
        }
      )
    }
  }
}
</script>

<style scoped>
.modalbackpos{
  margin-top: 80px;
}
.modalpos{
  height: 600px;
  border-radius: 16px;
  background-color: #ffffff;
  padding: 16px;
}
.modalbackpos >>> .modal-close{
  top: 100px;
}
.titletext{
  text-align: left;
  font-size: 24px;
  font-weight: bold;
  color: #333333;
}
.upcontents{
  /* 作用为把下面的组件挤下去 */
  height: calc(100% - 54px);
}
.selecttext{
  margin-top: 16px;
  text-align: left;
  font-size: 14px;
  color: #B2B2B2;
  margin-bottom: 8px;
}
.selectpos{
  margin-top: 8px;
}
.modalbackpos >>> .select select {
  width: 240px;
  height: 40px;
}
.modalbackpos >>> .select:not(.is-multiple):not(.is-loading)::after {
  top: 20px;
}
.inputwidth{
  width: 240px;
  height: 40px;
}
.priceicon{
  width: 32px;
  height: 32px;
}
.introducewidth{
  width: 448px;
  height: 150px;
}
.enterbuy{
  margin: 0 auto;
  width: 240px;
  height: 40px;
}
</style>
