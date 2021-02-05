<template>
  <div class="header">
    <nav class="navbar is-fixed-top nav_shadow" role="navigation" aria-label="main navigation">
      <div class="navbar-brand">
        <a class="navbar-item" href="/">
          <img class="ymsjlogo" src="../assets/ymsjlogo.png">
        </a>
        <a role="button" class="navbar-burger burger" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample" ref="nav" @click="clicknav">
          <span aria-hidden="true"></span>
          <span aria-hidden="true"></span>
          <span aria-hidden="true"></span>
          <span aria-hidden="true"></span>
          <span aria-hidden="true"></span>
        </a>
      </div>
      
      <div id="navbarBasicExample" class="navbar-menu" ref="navitem">
        <div class="navbar-start">
          <router-link class="navbar-item yellowfont" :to="{ name: 'Home'}">
            <span>
              <img class="pagelogo" src="../assets/title_slices/home.png">
            </span>
            首页
          </router-link>
          <router-link class="navbar-item whitefont" :to="{ name: 'AllCards'}">
            <span>
              <img class="pagelogo" src="../assets/title_slices/card.png">
            </span>
            卡牌大全
          </router-link>
          <router-link class="navbar-item whitefont" :to="{ name: 'SellCards'}">
            <span>
              <img class="pagelogo" src="../assets/title_slices/trade.png">
            </span>
            交易大厅
          </router-link>
          <router-link class="navbar-item whitefont" :to="{ name: 'Shop'}">
            <span>
              <img class="pagelogo" src="../assets/title_slices/store.png">
            </span>
            卡牌商店
          </router-link>
          <router-link class="navbar-item whitefont" :to="{ name: 'Backpack'}">
            <span>
              <img class="pagelogo" src="../assets/title_slices/backpack.png">
            </span>
            我的背包
          </router-link>
        </div>

        <div class="navbar-end">
          <div class="navbar-item" v-if="!islogin" >
            <button class="button is-outlined loginbutton" @click="login">
              <strong>登录钱包</strong>
            </button>
          </div>
          <img class="speakerlogo" 
            v-if="islogin" 
            @click="$router.push('/Mine')" 
            src="../assets/title_slices/avatar备份.png">
        </div>
      </div>
    </nav>
  </div>
</template>

<script>
// var Color = net.brehaut.Color

export default {
  data() {
    return {
      selected: "",
      title: "",
      islogin: false
    }
  },
  methods: {
    clicknav(){
      this.$refs.nav.classList.toggle("is-active");
      this.$refs.navitem.classList.toggle("is-active");
    },
    login(){
      this.islogin = !this.islogin;
    }
  }
}
</script>
<style scoped>
.navbar.is-fixed-top {
  background-color: #333333;
  height: 80px;
}
.yellowfont{
  color: #E7CE8A;
  font-size: 16px;
}
.whitefont{
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
  z-index: 200;
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
  border-radius: 0px;
}
</style>

