<template>
  <div>
    <b-modal class="modalbackpos" :active="isCardModalActive" 
      :on-cancel="cancelHandler"
      :width="1920"
      scroll="keep">
      <div class="modalpos">
        支付成功！请稍后到此页面查看。
        注：在此期间请不要刷新页面。
        <div class="buttonpos goldbuttonback" @click="cancelHandler">
          <a class="buttontext">确认</a>
        </div>
      </div>
    </b-modal>
  </div>
</template>

<script>
import drawablecards from '@/util/constants/drawablecards';

export default {
  data() {
    return {
      isCardModalActive: false,
      ops: {

      },
      drawedCards: [7,39,42,43,57,63,65,67,68,81],
      drawablecards: drawablecards
    }
  },
  props:['modalactive'],
  watch:{
    modalactive: function(val){
      this.isCardModalActive = val;
    }
  },
  methods: {
    cancelHandler(){
      this.isCardModalActive = false;
      this.$emit('update:modalactive', this.isCardModalActive);
    },
  }	
}
</script>

<style scoped>
.modalbackpos{
  margin-top: 80px;
}
.modalpos{
  margin-top: 60px;
  padding-bottom: 60px;
}
.modalbackpos >>> .modal-close{
  top: 100px;
}
.modalbackpos >>> .modal .modal-content {
  margin: 0 0;
  /* overflow-x: hidden; */
}
.bottombuttons{
  margin: 0 auto;
  margin-top: 24px;
}
.buttonpos{
  display: inline-block;
  margin: 24px;
}
.goldbuttonback{
  background-size: 100% 100%;
  background-image: url("../../assets/shop_slices/button1.png");
  width: 268px;
  height: 60px;
  padding-top: 16px;
}
.buttontext{
  color: #773f05;
  font-size: 20px;
  font-weight: bold;
}
</style>