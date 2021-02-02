import Vue from "vue";
import Router from "vue-router";
import Home from "@/views/Title/Title.vue";
import AllCards from "@/views/AllCards/AllCards.vue";
import SellCards from "@/views/SellCards/SellCards.vue";
import Shop from "@/views/Shop/Shop.vue";
import Backpack from "@/views/Backpack/Backpack.vue";

Vue.use(Router);

export default new Router({
  routes: [
    {
      path: "/",
      name: "Home",
      component: Home
    },
    {
      path: "/AllCards",
      name: "AllCards",
      component: AllCards
    },
    {
      path: "/SellCards",
      name: "SellCards",
      component: SellCards
    },
    {
      path: "/Shop",
      name: "Shop",
      component: Shop
    },
    {
      path: "/Backpack",
      name: "Backpack",
      component: Backpack
    }
  ]
});
