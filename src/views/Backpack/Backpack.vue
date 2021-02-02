<template>
  <div>
    <section class="is-cover allheight backpic">
      <!-- Main container -->
      <div class="blackhead">
        <nav class="level sellhead" style="margin-bottom: 36px;">
          <!-- Left side -->
          <div class="level-left">
            <div class="level-item">
              <span class="teamtext">阵营</span>
              <img class="teamicons" src="../../assets/title_slices/bgi1.png" />
              <img class="teamicons" src="../../assets/title_slices/bgi1.png" />
              <img class="teamicons" src="../../assets/title_slices/bgi1.png" />
              <img class="teamicons" src="../../assets/title_slices/bgi1.png" />
            </div>
            <div class="level-item">
              <span class="teamtext2">DP</span>
              <img class="teamicons" src="../../assets/title_slices/bgi1.png" />
              <img class="teamicons" src="../../assets/title_slices/bgi1.png" />
              <img class="teamicons" src="../../assets/title_slices/bgi1.png" />
            </div>
            <div class="level-item">
              <span class="teamtext3">AP</span>
              <img class="teamicons" src="../../assets/title_slices/bgi1.png" />
              <img class="teamicons" src="../../assets/title_slices/bgi1.png" />
            </div>
          </div>

          <!-- Right side -->
          <div class="level-right">
            <div class="level-item">
              <b-dropdown aria-role="list" style="margin-left: 12px;">
                <template #trigger="{ active }">
                  <button class="button allgoods">
                    <span style="margin-right: 12px;">全部卡牌</span>
                    <span class="icon is-small">
                      <img src="../../assets/sellcards_slices/paixu.png" />
                    </span>
                  </button>
                </template>
                <b-dropdown-item aria-role="listitem">Action</b-dropdown-item>
                <b-dropdown-item aria-role="listitem">Another action</b-dropdown-item>
                <b-dropdown-item aria-role="listitem">Something else</b-dropdown-item>
              </b-dropdown>
            </div>
            <div class="level-item">
              <div class="field has-addons">
                <p class="control">
                  <input class="input searchinput" type="text" placeholder="输入你想搜索的卡牌名称">
                </p>
                <p class="control">
                  <button class="button searchbutton">
                    <span class="icon searchicon">
                      <img src="../../assets/sellcards_slices/search.png" />
                    </span>
                  </button>
                </p>
              </div>
            </div>
          </div>
        </nav>
      </div>
      <div class="sellcards">
        <img class="onecard" src="../../assets/title_slices/bgi1.png" />
        <img class="onecard" src="../../assets/title_slices/bgi1.png" />
        <img class="onecard" src="../../assets/title_slices/bgi1.png" />
        <img class="onecard" src="../../assets/title_slices/bgi1.png" />
        <img class="onecard" src="../../assets/title_slices/bgi1.png" />
        <img class="onecard" src="../../assets/title_slices/bgi1.png" />
        <img class="onecard" src="../../assets/title_slices/bgi1.png" />
        <img class="onecard" src="../../assets/title_slices/bgi1.png" />
        <img class="onecard" src="../../assets/title_slices/bgi1.png" />
      </div>
    </section>
  </div>
</template>

<script>
export default {
	data(){
		return{

		}
  },
};
</script>

<style scoped>
.backpic{
  background-image: url("../../assets/allcards_slices/bgi7.png");
  background-size: auto 100%;
  background-position: center;
  margin-top: 80px;
}
.allheight{
  height: 840px;
}
.sellhead{
  margin: 0 auto;
  width: calc(100vw - 48px);
  max-width: 1376px;
  height: 80px;
  overflow: hidden;
}
.searchbutton{
  height: 40px;
}
.searchinput{
  height: 40px;
  width: 240px;
}
.searchicon{
  padding-left: 4px;
  padding-right: 4px;
}
.teamtext{
  color: #FFFFFF;
  font-size: 16px;
}
.teamicons{
  margin-left: 16px;
  width: 36px;
  height: 48px;
}
.teamtext2{
  margin-left: 90px;
  color: #FFFFFF;
  font-size: 16px;
}
.teamtext3{
  margin-left: 128px;
  color: #FFFFFF;
  font-size: 16px;
}
.blackhead{
  background-color: #00000080;
  width: 100vw;
}
.sellcards{
  margin: 0 auto;
  max-width: 1400px;
}
.onecard{
  display: inline-block;
  margin: 12px;
  width: 256px;
  height: 367px;
}
</style>
