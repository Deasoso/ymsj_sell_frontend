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

import { Dialog } from 'buefy'
Vue.use(Dialog)

import vuescroll from 'vuescroll';
Vue.use(vuescroll)

import { InfiniteScroll } from 'element-ui';
Vue.use(InfiniteScroll)

Vue.config.productionTip = false

Vue.prototype.Global = {
  contract_address: "0xE6881bfDa3c5421a7f5EFb196C350DdE0b08eBAd"
}

new Vue({
  router,
  store,
  render: h => h(App),
}).$mount('#app')

export default Vue;