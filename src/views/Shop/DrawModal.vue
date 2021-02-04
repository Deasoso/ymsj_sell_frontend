<template>
  <div>
    <b-modal class="modalbackpos" :active="isCardModalActive" 
      :on-cancel="cancelHandler"
      :width="1232"
      scroll="keep">
      <div class="modalpos">
        <div class="sellcards">
          <img class="onecard" src="../../assets/title_slices/bgi1.png">
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
  padding-left: 48px;
  padding-right: 48px;
}
.modalpos{
  width: calc(100vw - 96px);
  max-width: 1232px;
  margin-top: 140px;
  padding-bottom: 140px;
}
/deep/ .modal-close{
  top: 100px;
}
.sellcards{
  margin: 0 auto;
  max-width: 1400px;
}
.onecard{
  display: inline-block;
  margin: 12px;
}
</style>