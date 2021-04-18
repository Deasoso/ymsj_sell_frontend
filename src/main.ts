import Vue from 'vue'
import App from './App.vue'

import router from "./router";
import { store } from './store/'

// @ts-ignore
import Bulma from 'bulma'
import 'bulma/css/bulma.min.css'
Vue.use(Bulma)

// @ts-ignore
import Buefy, { Dialog } from 'buefy'
import 'buefy/dist/buefy.css'
Vue.use(Buefy)
Vue.use(Dialog)

import vuescroll from 'vuescroll';
Vue.use(vuescroll)

import { InfiniteScroll } from 'element-ui';
Vue.use(InfiniteScroll)

import VueClipboard from 'vue-clipboard2'
Vue.use(VueClipboard)

Vue.config.productionTip = false

Vue.prototype.Global = {
  contract_address: "0xA124938ECE6A4aD35e624abF65139C62236dD672"
}

new Vue({
  router,
  store,
  render: h => h(App),
}).$mount('#app')

export default Vue;
