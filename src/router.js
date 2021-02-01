import Vue from "vue";
import Router from "vue-router";
import Home from "@/views/Title/Title.vue";
import AllCards from "@/views/AllCards/AllCards.vue";

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
    }
  ]
});
