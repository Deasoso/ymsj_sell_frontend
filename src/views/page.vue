<template>
  <div id="app">
    
    <div class="juli1">我是page1</div>
    <div v-for="index in list" :key="index"> 
      <mt-cell
      :title="index.name"
      is-link
      value="带链接">
    </mt-cell>
      
      <!-- {{index.price}} -->
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
    addbutton(ssss){
      this.amount += ssss;
    }
  }
}
</script>

<style>
.juli1{
  margin-top: 100px;
  float: left;
}
</style>
