import Vue from 'vue'
import App from './App.vue'
import router from "./router";

import MintUI from "mint-ui";
import "mint-ui/lib/style.css";
Vue.use(MintUI);

import Bulma from 'bulma'
import 'bulma/css/bulma.css'
Vue.use(Bulma)

Vue.config.productionTip = false

new Vue({
  router,
  render: h => h(App),
}).$mount('#app')
