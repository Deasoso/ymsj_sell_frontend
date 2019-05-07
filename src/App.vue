<template>
  <div id="app">
    <Header />
      <router-view />
    <Footer />
  </div>
</template>

<script>
import 'animate.css'
import {WOW} from 'wowjs'    
import Header from "@/components/Header";
import Footer from "@/components/Footer";

export default {
  name: 'app',
  components: {
    Header,
    Footer
  },
  data: () => {
     return {
       amount: 1000
     }
  },
  methods: {
    addbutton(ssss){
      this.amount += ssss;
    }
  },
  mounted() {
    new WOW().init() 
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
}
</style>
