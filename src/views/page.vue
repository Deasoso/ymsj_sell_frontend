<template>
  <div id="app">
    <mt-cell
  title="标题文字"
  is-link
  value="带链接">
</mt-cell>
    我是page1
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
