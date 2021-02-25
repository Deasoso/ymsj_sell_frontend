import Vue from 'vue'
import App from './App.vue'

import router from "./router";
import { store } from './store/'

import Bulma from 'bulma'
import 'bulma/css/bulma.min.css'
Vue.use(Bulma)

import Buefy from 'buefy'
import 'buefy/dist/buefy.css'
Vue.use(Buefy)

import vuescroll from 'vuescroll';
Vue.use(vuescroll)

Vue.config.productionTip = false

Vue.prototype.Global = {
  contract_address: "0x5c883782341fCd4B8fB2e722FBE1E758Ea4BCE37"
}

new Vue({
  router,
  store,
  render: h => h(App),
}).$mount('#app')

export default Vue;