<template>
  <div id="app">
    
    <div class="juli1">我是page1</div>
    <img class="kuandu25" src="../assets/logo.png"  alt="imggg" />
    <img class="kuandu25" src="../assets/logo.png"  alt="imggg" />
    <img class="kuandu25" src="../assets/logo.png"  alt="imggg" />
    <img class="kuandu25" src="../assets/logo.png"  alt="imggg" />
    <mt-cell
      title="标题文字"
      is-link
      value="带链接">
    </mt-cell>
    <mt-button type="primary" @click="addamount(2)" class="kaozuo">
      primary
    </mt-button>
    {{amount}}
    <div v-for="index in list" :key="index"> 
      {{index.name}}/{{index.price}}
    </div>
  </div>
</template>

<script>
export default {
  name: 'app',
  data: () =>{
     return{
       amount: 1000,
       list:[
         {
           name: "tushu1",
           price: 100
         },
         {
           name: "tushu2",
           price: 200
         }
       ]
     }
  },
  methods:{
    addamount(ssss){
      this.$router.push("/newpage");
      // this.amount += ssss;
    }
  }
}
</script>

<style>
.juli1{
  margin-top: 100px;
  float: left;
}
.kaozuo{
  float: left;
}
.kuandu25{
  width: 25%;
  float: left;
}
</style>
