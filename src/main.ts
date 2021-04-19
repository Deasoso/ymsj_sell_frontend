import Vue from 'vue'
import App from './App.vue'

import router from './router'
import { store } from './store/'

// @ts-ignore
import Bulma from 'bulma'
import 'bulma/css/bulma.min.css'

// @ts-ignore
import Buefy, { Dialog } from 'buefy'
import 'buefy/dist/buefy.css'

import vuescroll from 'vuescroll'

import { InfiniteScroll } from 'element-ui'

import VueClipboard from 'vue-clipboard2'
import { i18n } from '@/i18n'
Vue.use(Bulma)
Vue.use(Buefy)
Vue.use(Dialog)
Vue.use(vuescroll)
Vue.use(InfiniteScroll)
Vue.use(VueClipboard)

Vue.config.productionTip = false

Vue.prototype.Global = {
  contract_address: '0xA124938ECE6A4aD35e624abF65139C62236dD672'
}

new Vue({
  i18n,
  router,
  store,
  render: h => h(App)
}).$mount('#app')

export default Vue
