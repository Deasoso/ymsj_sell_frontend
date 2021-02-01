<template>
  <div>
    <section class="is-cover allheight backpic">
      <div class="searchmore">
        查看更多
        <img class="arrowlogo" src="../../assets/allcards_slices/goto.png">
      </div>
      <div class="allcards">
        <img class="teamlogo" src="../../assets/title_slices/bgi1.png">
        <div class="teamcards">
          <vue-scroll :ops="ops">
            <div :style="getCardsWidth([1,1,1,1,1,1,1])">
              <img class="teamcard1" src="../../assets/title_slices/bgi1.png">
              <img class="teamcard" src="../../assets/title_slices/bgi1.png">
              <img class="teamcard" src="../../assets/title_slices/bgi1.png">
              <img class="teamcard" src="../../assets/title_slices/bgi1.png">
              <img class="teamcard" src="../../assets/title_slices/bgi1.png">
              <img class="teamcard" src="../../assets/title_slices/bgi1.png">
              <img class="teamcard" src="../../assets/title_slices/bgi1.png">
            </div>
          </vue-scroll>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
  export default {
    data() {
      return {
        ops: {
          scrollPanel: {
            scrollingX: true,
            scrollingY: false,
          }
        },
      }
    },
    methods:{
      getCardsWidth(cards){
        return "width:" + ((cards.length * 256) + ((cards.length - 1) * 24)) + "px;";
      }
    }
  }
</script>

<style scoped>
.backpic{
  margin-top: 80px;
  background-image: url("../../assets/allcards_slices/bgi7.png");
  background-size: auto 100%;
  background-position: center;
}
.whiteborder{
  text-shadow:5px 2px 6px #000000;
  color: #ffffff
}
.allheight{
  height: 840px;
}
.searchmore{
  margin-right: 272px;
  text-align: right;
  font-size: 16px;
  padding-top: 48px;
}
.arrowlogo{
  width: 9px;
  height: 14px;
  margin-left: 8px;
}
.teamlogo{
  width: 128px;
  height: 174px;
  margin-left: 272px;
  margin-top: 85px;
}
.allcards{
  text-align: left;
}
.teamcards{
  margin-left: 448px;
  margin-top: -254px;
  width: calc(100vw - 448px - 272px);
  height: 367px;
}
.teamcard1{
  width: 256px;
  height: 367px;
  display: inline-block;
}
.teamcard{
  width: 256px;
  height: 367px;
  margin-left: 24px;
  display: inline-block;
}
</style>