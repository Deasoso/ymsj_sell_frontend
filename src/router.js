import Vue from "vue";
import Router from "vue-router";
import Home from "@/views/HelloWorld.vue";
import Page1 from "@/views/page.vue";
import Page2 from "@/views/page2.vue";

Vue.use(Router);

export default new Router({
  routes: [
    {
      path: "/Home",
      name: "Home",
      component: Home
    },
    {
      path: "/page1",
      name: "Page1",
      component: Page1
    },
    {
      path: "/page2",
      name: "Page2",
      component: Page2
    },
  ]
});
