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
  contract_address: "0xf487029a9f444e99476771E0e8bCAe39E3fD5C96"
}

new Vue({
  router,
  store,
  render: h => h(App),
}).$mount('#app')

export default Vue;