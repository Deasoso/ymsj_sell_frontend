<template>
  <div>
    <b-modal class="modalbackpos" :active="isCardModalActive" 
      :on-cancel="cancelHandler"
      :width="480"
      scroll="keep">
      <div class="modalpos">
        <div class="upcontents">
          <div class="titletext">新建交易</div>
          <!-- <button
            type="button"
            class="delete"
            @click="cancelHandler"/> -->
          <div class="selecttext">交易对象</div>
          <b-select 
            placeholder="选择交易对象" 
            class="selectpos" 
            style="width: 240px;height: 40px;">
            <option
              v-for="option in [{'id':'1'},{'id':'2'},{'id':'3'},{'id':'4'}]"
              :value="option.id"
              :key="option.id">
              {{ option.id }}
            </option>
          </b-select>

          <div class="selecttext">商品价格</div>
          <b-input placeholder="输入你想卖的价格" class="inputwidth" v-model="price"></b-input>

          <div class="selecttext">货币种类</div>
          <b-select 
            placeholder="选择货币种类" 
            class="selectpos" 
            style="width: 240px;height: 40px;">
            <!-- <img class="priceicon" src="../../assets/title_slices/bgi1.png"> -->
            <option
              v-for="option in [{'id':'1'},{'id':'2'},{'id':'3'},{'id':'4'}]"
              :value="option.id"
              :key="option.id">
              {{ option.id }}
            </option>
          </b-select>

          <div class="selecttext">商品简介</div>
          <b-input placeholder="输入你想卖的价格" class="introducewidth" v-model="price" type="textarea"></b-input>
        </div>

        <button class="button is-dark enterbuy">
          <span>发布商品</span>
        </button>
        
      </div>
    </b-modal>
  </div>
</template>

<script>
  export default {
    data() {
      return {
        isCardModalActive: false,
        ops: {

        },
        price: '',
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
  height: 600px;
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
/deep/ .select select {
  width: 240px;
  height: 40px;
}
/deep/ .select:not(.is-multiple):not(.is-loading)::after {
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