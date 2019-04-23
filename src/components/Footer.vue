<template>
  <div class="footer">
    <mt-tabbar v-model="selected"
    :fixed="true">
      <mt-tab-item id="主页" @click.native="menuTab('/Home')">
        <img slot="icon" src="../assets/logo.png">
        主页
      </mt-tab-item>
      <mt-tab-item id="资产公告"  @click.native="menuTab('')">
        <img slot="icon" src="../assets/logo.png">
        资产公告
      </mt-tab-item>
      <mt-tab-item id="路线图" @click.native="menuTab('')">
        <img slot="icon" src="../assets/logo.png">
        路线图
      </mt-tab-item>
      <mt-tab-item id="客服" @click.native="menuTab('')">
        <img slot="icon" src="../assets/logo.png">
        客服
      </mt-tab-item>
      <mt-tab-item id="我的" @click.native="menuTab('/User')">
        <img slot="icon" src="../assets/logo.png">
        我的
      </mt-tab-item>
    </mt-tabbar>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
import {Toast} from "mint-ui"
export default {
  name: "NavigateTabBar",
  data: () => ({
    selected: 0
  }),
  component:{
      Toast
  },
  methods: {
    menuTab(name) {
      this.$router.push(name);
    }
  }
};
</script>
