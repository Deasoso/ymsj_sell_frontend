<template>
  <div>
    <footer class="footer">
      <div class="container">
        <div class="columns">
          <div class="column is-4">
            <div class="content">
              <router-link class="navbar-item"
                           :to="{ name: 'Home'}">
                Home
              </router-link>
              <div class="navbar-item" @click="setLang('zh-CN')">
                简体中文（中国）
              </div>
              <div class="navbar-item" @click="setLang('en-US')">
                English (United State)
              </div>
              <!-- <router-link class="navbar-item"
                          :to="{ name: 'FAQ'}">
                FAQ
              </router-link> -->
            </div>
          </div>
          <div class="column is-4">
            <!-- <div class="content">
              <router-link class="navbar-item"
                          :to="{ name: 'Term'}">
                Terms of Service
              </router-link>
              <router-link class="navbar-item"
                          :to="{ name: 'Privacy'}">
                Privacy Policy
              </router-link>
            </div> -->
          </div>
          <div class="column is-4">
            <div class="content">
              <span> Contact Us</span>
              <!-- <p><a href="https://www.baidu.com/"
                target="_blank">
                @Telegram
              </a></p>
              <p><a href="https://www.baidu.com/"
                target="_blank">
                @Discord
              </a></p> -->
              <p>Wechat Group: add wechat friend "guanchao71"</p>
            </div>
          </div>
        </div>
        <div class="content has-text-centered">
          <p>
            <small>
              All rights reserved. <br>
              &copy; Copyright 2018
              <strong>UnderWord.pro</strong>
            </small>
          </p>
        </div>
      </div>
    </footer>
  </div>
</template>
<script lang="ts">
import { defineComponent } from '@vue/composition-api'
import { setLang } from '@/i18n'

export default defineComponent({
  name: 'Footer',
  setup () {
    return {
      setLang
    }
  }
})
</script>
<style scoped>
.footer{
  background-color: #333333;
  color: #ffffff;
  padding: 3rem 1.5rem 3rem;
}
strong {
  color: #ffffff;
}
.navbar-item{
  color: #ffffff;
  cursor: pointer;
}
.navbar-item:hover{
  color: black;
  background: white;
}
</style>
