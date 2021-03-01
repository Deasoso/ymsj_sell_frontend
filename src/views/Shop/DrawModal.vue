<template>
  <div>
    <b-modal class="modalbackpos" :active="isCardModalActive" 
      :on-cancel="cancelHandler"
      :width="1920"
      scroll="keep">
      <div class="modalpos">
        <div class="sellcards">
          <img 
            v-for="(item, index) in drawedcards" :key="index" 
            class="onecard" 
            :src="drawablecards[item.id].url">
          <div class="bottombuttons">
          <div class="buttonpos goldbuttonback" @click="$router.push('/Backpack')">
            <a class="buttontext">我的背包</a>
          </div>
          <div class="buttonpos goldbuttonback" @click="cancelHandler">
            <a class="buttontext">返回商店</a>
          </div>
        </div>
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
      drawablecards: drawablecards
    }
  },
  props:['modalactive', 'drawedcards'],
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
  },
  mounted(){
    this.isCardModalActive = this.modalactive;
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
  filter: drop-shadow(0 0 24px #FCE81280);
  /* box-shadow: 0px 0px 48px 12px #FCE81280; */
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
  cursor: pointer;
}
.buttontext{
  color: #773f05;
  font-size: 20px;
  font-weight: bold;
}
</style>