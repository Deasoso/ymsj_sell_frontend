import Vue from "vue";
import Router from "vue-router";
import Home from "@/views/HelloWorld.vue";

Vue.use(Router);

export default new Router({
  routes: [
    {
      path: "/Home",
      name: "Home",
      component: Home
    },
  ]
});
