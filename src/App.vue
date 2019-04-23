<template>
  <div id="app">
    <Header />
      <router-view />
    <Footer />
  </div>
</template>

<script>
import "bulma";
import "../node_modules/mint-ui/lib/style.css";
import Header from "@/components/Header";
import Footer from "@/components/Footer";

export default {
  name: 'app',
  components: {
    Header,
    Footer
  },
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
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
