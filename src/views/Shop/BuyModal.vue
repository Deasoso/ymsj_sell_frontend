<template>
  <div>
    <b-modal class="modalbackpos" :active="isCardModalActive" 
      :on-cancel="cancelHandler"
      :width="480"
      scroll="keep">
      <div class="modalpos">
        <div class="upcontents">
          <div class="titletext">购买宝石</div>
          <!-- <button
            type="button"
            class="delete"
            @click="cancelHandler"/> -->
          <button class="button selectgem gembuttonleft1">
            <img class="gemicon" src="../../assets/shop_slices/宝石15.png">
            <span>100</span>
          </button>
          <button class="button selectgem gembuttonright">
            <img class="gemicon" src="../../assets/shop_slices/宝石15.png">
            <span>200</span>
          </button>

          <button class="button selectgem gembuttonleft">
            <img class="gemicon" src="../../assets/shop_slices/宝石15.png">
            <span>500</span>
          </button>
          <button class="button selectgem gembuttonright">
            <img class="gemicon" src="../../assets/shop_slices/宝石15.png">
            <span>1000</span>
          </button>

          <button class="button selectgem gembuttonleft">
            <img class="gemicon" src="../../assets/shop_slices/宝石15.png">
            <span>2000</span>
          </button>
          <button class="button selectgem gembuttonright">
            <img class="gemicon" src="../../assets/shop_slices/宝石15.png">
            <span>5000</span>
          </button>

          <button class="button selectgem gembuttonleft">
            <img class="gemicon" src="../../assets/shop_slices/宝石15.png">
            <span>10000</span>
          </button>
          <button class="button selectgem gembuttonright">
            <img class="gemicon" src="../../assets/shop_slices/宝石15.png">
            <span>50000</span>
          </button>
        </div>

        <div class="pricetext">总计需要花费0.01 ETH</div>
        <button class="button is-dark enterbuy">
          <span>确认购买</span>
        </button>
        
      </div>
    </b-modal>
  </div>
</template>

<script>
  export default {
    data() {
      return {
        isCardModalActive: false
      }
    },
    props:['buymodalactive'],
    watch:{
      buymodalactive: function(val){
        this.isCardModalActive = val;
      }
    },
    methods: {
      cancelHandler(){
        this.isCardModalActive = false;
        this.$emit('update:buymodalactive', this.isCardModalActive);
      },
    }	
  }
</script>

<style scoped>
.modalbackpos{
  margin-top: 80px;
}
.modalpos{
  height: 400px;
  border-radius: 16px;
  background-color: #ffffff;
  padding: 16px;
}
/deep/ .modal-close{
  top: 100px;
}
.titletext{
  text-align: left;
  font-size: 24px;
  font-weight: bold;
  color: #333333;
  margin-bottom: 16px;
}
.gemicon{
  width: 30px;
  height: 30px;
  margin-right: 4px;
  margin-left: 70px;
}
.selectgem{
  width: 220px;
  height: 40px;
  margin-bottom: 8px;
  color: #815004;
  font-size: 14px;
  font-weight: bold;
  justify-content: left;
  padding: 0px;
  border-color: #E4C46D;
}
.gembuttonleft1{
  background-color: #E4C46D;
}
.gembuttonleft{
  background-color: #ffffff;
}
.gembuttonright{
  margin-left: 8px;
  background-color: #ffffff;
}
.upcontents{
  /* 作用为把下面的组件挤下去 */
  height: calc(100% - 74px);
}
.pricetext{
  text-align: center;
  font-size: 14px;
  color: #B2B2B2;
  margin-bottom: 8px;
}
.enterbuy{
  margin: 0 auto;
  width: 240px;
  height: 40px;
}
</style>