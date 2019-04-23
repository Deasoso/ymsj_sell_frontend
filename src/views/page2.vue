<template>
  <div id="app">
    我是page2
    1111
  </div>
</template>

<script>
export default {
  name: 'app',
  data: () =>{
     return{
       amount: 1000
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

</style>
