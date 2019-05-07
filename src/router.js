import Vue from "vue";
import Router from "vue-router";
import Home from "@/views/HelloWorld.vue";
import Page1 from "@/views/page.vue";
import Page2 from "@/views/page2.vue";
import newPage from "@/views/newpage.vue";

Vue.use(Router);

export default new Router({
  routes: [
    {
      path: "/",
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
    {
      path: "/newpage",
      name: "newpage",
      component: newPage
    },
  ]
});
