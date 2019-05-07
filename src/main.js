import Vue from 'vue'
import App from './App.vue'
import router from "./router";

import MintUI from "mint-ui";
import "mint-ui/lib/style.css";
Vue.use(MintUI);

import Buefy from 'buefy'
import 'buefy/dist/buefy.css'
Vue.use(Buefy)

Vue.config.productionTip = false

new Vue({
  router,
  render: h => h(App),
}).$mount('#app')
