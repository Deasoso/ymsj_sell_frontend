<template>
  <div>
    <b-modal class="modalbackpos" :active="isCardModalActive" 
      :on-cancel="cancelHandler"
      :width="1920"
      scroll="keep">
      <div class="modalpos">
        <div class="sellcards">
          <img class="onecard" src="../../assets/title_slices/bgi1.png">
          <img class="onecard" src="../../assets/title_slices/bgi1.png">
          <img class="onecard" src="../../assets/title_slices/bgi1.png">
          <img class="onecard" src="../../assets/title_slices/bgi1.png">
          <img class="onecard" src="../../assets/title_slices/bgi1.png">
          <img class="onecard" src="../../assets/title_slices/bgi1.png">
          <img class="onecard" src="../../assets/title_slices/bgi1.png">
          <img class="onecard" src="../../assets/title_slices/bgi1.png">
          <img class="onecard" src="../../assets/title_slices/bgi1.png">
          <img class="onecard" src="../../assets/title_slices/bgi1.png">
        </div>
        <div class="buttonpos1 goldbuttonback">
          <a class="buttontext">我的背包</a>
        </div>
        <div class="buttonpos2 goldbuttonback">
          <a class="buttontext">返回商店</a>
        </div>
      </div>
    </b-modal>
  </div>
</template>

<script>
  export default {
    data() {
      return {
        isCardModalActive: true,
        ops: {

        },
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
/deep/ .modal-close{
  top: 100px;
}
.sellcards{
  text-align: center;
  width: 1520px;
  margin: 0 auto;
}
.onecard{
  display: inline-block;
  margin: 24px;
  width: 256px;
  height: 367px;
  box-shadow: 0px 0px 48px 12px #FCE81280;
}
/deep/ .modal .modal-content {
  margin: 0 0;
  /* overflow-x: hidden; */
}
.buttonpos1{
  margin-left: calc(50vw - 268px - 24px);
  margin-top: 48px;
}
.buttonpos2{
  margin-left: calc(50vw + 24px);
  margin-top: -60px;
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