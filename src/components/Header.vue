<template>
  <div class="header">
    <nav class="navbar is-fixed-top nav_shadow" role="navigation" aria-label="main navigation">
      <div class="navbar-brand">
        <a class="navbar-item" href="https://bulma.io">
          <img class="ymsjlogo" src="../assets/ymsjlogo.png">
        </a>
        <a role="button" class="navbar-burger burger" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample" ref="nav" @click="clicknav">
          <span aria-hidden="true"></span>
          <span aria-hidden="true"></span>
          <span aria-hidden="true"></span>
        </a>
      </div>

      <div id="navbarBasicExample" class="navbar-menu" ref="navitem">
        <div class="navbar-start">
          <a class="navbar-item yellowfont">
            <span>
              <img class="pagelogo" src="../assets/title_slices/home.png">
            </span>
            首页
          </a>
          <a class="navbar-item whitefont">
            <span>
              <img class="pagelogo" src="../assets/title_slices/card.png">
            </span>
            卡牌大全
          </a>
          <a class="navbar-item whitefont">
            <span>
              <img class="pagelogo" src="../assets/title_slices/trade.png">
            </span>
            交易大厅
          </a>
          <a class="navbar-item whitefont">
            <span>
              <img class="pagelogo" src="../assets/title_slices/store.png">
            </span>
            卡牌商店
          </a>
          <a class="navbar-item whitefont">
            <span>
              <img class="pagelogo" src="../assets/title_slices/backpack.png">
            </span>
            我的背包
          </a>
        </div>

        <div class="navbar-end">
          <div class="navbar-item">
            <button class="button is-outlined loginbutton">
              <strong>登录钱包</strong>
            </button>
          </div>
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
      title: ""
    }
  },
  methods: {
    clicknav(){
      this.$refs.nav.classList.toggle("is-active");
      this.$refs.navitem.classList.toggle("is-active");
    },
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
</style>

