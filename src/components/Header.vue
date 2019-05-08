<template>
  <div class="header">
    <nav class="navbar is-fixed-top" role="navigation" aria-label="main navigation" :style="{ backgroundColor: tweenedCSSColor }">
      <div class="navbar-brand">
        <a class="navbar-item" href="https://bulma.io">
          <img src="https://bulma.io/images/bulma-logo.png" width="112" height="28">
        </a>

        <a role="button" class="navbar-burger burger" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample" ref="nav" @click="clicknav">
          <span aria-hidden="true"></span>
          <span aria-hidden="true"></span>
          <span aria-hidden="true"></span>
        </a>
      </div>

      <div id="navbarBasicExample" class="navbar-menu" ref="navitem">
        <div class="navbar-start">
          <a class="navbar-item">
            Home
          </a>

          <a class="navbar-item">
            Documentation
          </a>

          <div class="navbar-item has-dropdown is-hoverable">
            <a class="navbar-link">
              More
            </a>

            <div class="navbar-dropdown">
              <a class="navbar-item">
                About
              </a>
              <a class="navbar-item">
                Jobs
              </a>
              <a class="navbar-item">
                Contact
              </a>
              <hr class="navbar-divider">
              <a class="navbar-item">
                Report an issue
              </a>
            </div>
          </div>
        </div>

        <div class="navbar-end">
          <div class="navbar-item">
            <div class="buttons">
              <a class="button is-primary">
                <strong>Sign up</strong>
              </a>
              <a class="button is-light">
                Log in
              </a>
            </div>
          </div>
        </div>
      </div>
    </nav>
  </div>
</template>

<script>
var Color = net.brehaut.Color

export default {
  data() {
    return {
      selected: "",
      title: "",
      color: {
        red: 255,
        green: 255,
        blue: 255,
        alpha: 0
      },
      tweenedColor: {},
      colorshowing: false,
    }
  },
  mounted(){
    window.addEventListener('scroll', this.handleScroll);
  },
  created: function () {
    this.tweenedColor = Object.assign({}, this.color)
  },
  methods: {
    clicknav(){
      // console.log(this.$refs.nav.classList);
      this.$refs.nav.classList.toggle("is-active");
      this.$refs.navitem.classList.toggle("is-active");
    },
    handleScroll(){
      const top = document.documentElement.scrollTop;
      if (top > 60 && !this.colorshowing) {
        this.color = new Color({
          red: 255,
          green: 255,
          blue: 255,
          alpha: 1.0
        }).toRGB();
        this.colorshowing = true;
      } else if (top <= 59 && this.colorshowing){
        this.color = new Color({
          red: 255,
          green: 255,
          blue: 255,
          alpha: 0
        }).toRGB();
        this.colorshowing = false;
      }
    }
  },
  watch: {
    color: function () {
      function animate () {
        if (TWEEN.update()) {
          requestAnimationFrame(animate)
        }
      }
      new TWEEN.Tween(this.tweenedColor)
        .to(this.color, 100)
        .start()
      animate()
    }
  },
  computed: {
    tweenedCSSColor: function () {
      // console.log(new Color({
      //   red: this.tweenedColor.red,
      //   green: this.tweenedColor.green,
      //   blue: this.tweenedColor.blue,
      //   alpha: this.tweenedColor.alpha
      // }).toCSS());
      if(this.tweenedColor.alpha == 1){
        return "rgba(255,255,255,1)";
      }else{
        return new Color({
          red: this.tweenedColor.red,
          green: this.tweenedColor.green,
          blue: this.tweenedColor.blue,
          alpha: this.tweenedColor.alpha
        }).toCSS()
      }
    }
  },
}
</script>
<style>
.header{
  z-index: 1000;
}
</style>

