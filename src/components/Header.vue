<template>
  <div class="header">
    <nav class="navbar is-fixed-top nav_shadow" role="navigation" aria-label="main navigation">
      <div class="navbar-brand">
        <a class="navbar-item" href="/">
          <img class="ymsjlogo" src="http://ymsjimg.deaso40.com/ymsjlogo.png">
        </a>
        <a role="button" class="navbar-burger burger" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample" ref="nav" @click="clicknav" style="height: 80px;">
          <span aria-hidden="true"></span>
          <span aria-hidden="true"></span>
          <span aria-hidden="true"></span>
          <span aria-hidden="true"></span>
          <span aria-hidden="true"></span>
        </a>
      </div>

      <div id="navbarBasicExample" class="navbar-menu" ref="navitem">
        <div class="navbar-start">
          <router-link v-for="(item, index) in headeritems" :key="index"
            :class="'navbar-item ' + ((activeItem == item.to) ? 'yellowfont' : 'whitefont')"
            :to="{name: item.to}">
            <span>
              <img class="pagelogo" :src="(activeItem == item.to) ? item.active_url : item.url">
            </span>
            {{item.name}}
          </router-link>
        </div>

        <div class="navbar-end">
          <div class="navbar-item" v-if="!hasLoggedIn" >
            <button class="button is-outlined loginbutton" @click="login">
              <strong>{{$t('登录钱包')}}</strong>
            </button>
          </div>
          <img class="speakerlogo"
            v-if="hasLoggedIn"
            @click="$router.push('/Mine')"
            :src="randomavatars[parseInt(account) % randomavatars.length].url">
        </div>
      </div>
    </nav>
  </div>
</template>

<script>
import headeritems from '@/util/constants/headeritems'
import randomavatars from '@/util/constants/randomavatars'
import { defineComponent, ref, watch, onMounted, computed } from '@vue/composition-api'
import { useRouter, useStore } from '@/util/composition'
import { t } from '@/i18n'

export default defineComponent({
  name: 'Header',
  setup (_, self) {
    const store = useStore(self)
    const { route, router } = useRouter(self)
    const selected = ref('')
    const title = ref('')
    const hasLoggedIn = ref(false)
    const account = ref(1)
    watch(() => store.state.web3.isInjected, (val) => {
      if (val) {
        account.value = store.state.web3.coinbase
        hasLoggedIn.value = true
      } else {
        account.value = 1
        hasLoggedIn.value = false
      }
    })
    const clickNav = () => {
      self.refs.nav.classList.toggle('is-active')
      self.refs.navitem.classList.toggle('is-active')
    }
    const login = async () => {
      if (!store.state.web3.isInjected) {
        try {
          if (!window.web3) {
            self.root.$buefy.dialog.alert({
              title: t('未检测到钱包'),
              message: t('请先安装Metamask钱包并解锁。'),
              confirmText: t('确认')
            })
            hasLoggedIn.value = false
            return
          }
          const accounts = await window.ethereum.send('eth_requestAccounts')
          router.go(0)
          account.value = accounts[0]
          hasLoggedIn.value = true
        } catch (error) {
          hasLoggedIn.value = false
        }
      } else {
        account.value = store.state.web3.coinbase
        hasLoggedIn.value = false
      }
    }
    const activeItem = computed(() => route.path.split('/')[1] || 'Home')
    onMounted(() => {
      if (store.state.web3.isInjected) {
        account.value = store.state.web3.coinbase
        hasLoggedIn.value = true
      }
    })
    return {
      login,
      clickNav,
      selected,
      title,
      hasLoggedIn,
      headeritems,
      account,
      randomavatars,
      activeItem
    }
  }
})
</script>
<style scoped>
.navbar.is-fixed-top {
  background-color: #333333;
  height: 80px;
}
.yellowfont{
  color: #E7CE8A !important;
  font-size: 16px;
}
.whitefont, a.navbar-item:hover{
  color: #b2b2b2;
  font-size: 16px;
}
.nav_shadow{
  box-shadow: 0px 0px 10px 0px hsl(0, 0%, 67%)
}
.loginbutton{
  background-color: #333333;
  color: #E7CE8A;
  height: 40px;
  width: 160px;
}
.pagelogo{
  margin-left: 8px;
  width: 28px;
  height: 30px;
  margin-right: 8px;
}
.ymsjlogo{
  margin-left: 8px;
  width: 96px;
  height: 40px;
  max-height: none;
}
.header{
  position: relative;
  z-index: 1200;
}
strong {
  color: #ffffff !important;
  font-weight: 700;
}
.speakerlogo{
  margin-right: 24px;
  margin-top: 24px;
  width: 32px;
  height: 32px;
  border-radius: 50%;
}
.header >>> a.navbar-item:focus, a.navbar-item:focus-within, a.navbar-item:hover, a.navbar-item.is-active, .navbar-link:focus, .navbar-link:focus-within, .navbar-link:hover, .navbar-link.is-active{
  background-color: #666666;
}
</style>
