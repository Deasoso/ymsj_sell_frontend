<template>
  <div>
    <section class="is-cover allheight backpic">
      <div class="searchmore">
        <nav class="level" style="margin-bottom: 0px;">
          <div class="level-left">
          </div>
          <div class="level-right" @click="$router.push('/Backpack')">
            查看更多
            <img class="arrowlogo" src="../../assets/allcards_slices/goto.png">
          </div>
        </nav>
      </div>
      <div class="allcards">
        <nav class="level">
          <div class="level-left">
            <img class="teamlogo" src="../../assets/title_slices/bgi1.png">
          </div>
          <div class="level-right">
            <div class="teamcards">
              <vue-scroll :ops="ops">
                <div :style="getCardsWidth([1,1,1,1,1,1,1])">
                  <img class="teamcard1" @click="$router.push('/CardDetail')" src="../../assets/cards/01联会禁音使.png">
                  <img class="teamcard" @click="$router.push('/CardDetail')" src="../../assets/cards/01联会禁音使.png">
                  <img class="teamcard" @click="$router.push('/CardDetail')" src="../../assets/cards/01联会禁音使.png">
                  <img class="teamcard" @click="$router.push('/CardDetail')" src="../../assets/cards/01联会禁音使.png">
                  <img class="teamcard" @click="$router.push('/CardDetail')" src="../../assets/cards/01联会禁音使.png">
                  <img class="teamcard" @click="$router.push('/CardDetail')" src="../../assets/cards/01联会禁音使.png">
                  <img class="teamcard" @click="$router.push('/CardDetail')" src="../../assets/cards/01联会禁音使.png">
                </div>
              </vue-scroll>
            </div>
          </div>
        </nav>
      </div>
      <div class="searchmore">
        <nav class="level">
          <div class="level-left">
          </div>
          <div class="level-right" @click="$router.push('/Backpack')">
            查看更多
            <img class="arrowlogo" src="../../assets/allcards_slices/goto.png">
          </div>
        </nav>
      </div>
      <div class="allcards">
        <nav class="level">
          <div class="level-left">
            <img class="teamlogo" src="../../assets/title_slices/bgi1.png">
          </div>
          <div class="level-right">
            <div class="teamcards">
              <vue-scroll :ops="ops">
                <div :style="getCardsWidth([1,1,1,1,1,1,1])">
                  <img class="teamcard1" @click="$router.push('/CardDetail')" src="../../assets/cards/01联会禁音使.png">
                  <img class="teamcard" @click="$router.push('/CardDetail')" src="../../assets/cards/01联会禁音使.png">
                  <img class="teamcard" @click="$router.push('/CardDetail')" src="../../assets/cards/01联会禁音使.png">
                  <img class="teamcard" @click="$router.push('/CardDetail')" src="../../assets/cards/01联会禁音使.png">
                  <img class="teamcard" @click="$router.push('/CardDetail')" src="../../assets/cards/01联会禁音使.png">
                  <img class="teamcard" @click="$router.push('/CardDetail')" src="../../assets/cards/01联会禁音使.png">
                  <img class="teamcard" @click="$router.push('/CardDetail')" src="../../assets/cards/01联会禁音使.png">
                </div>
              </vue-scroll>
            </div>
          </div>
        </nav>
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
      }
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
.allheight{
  height: 1000px;
}
.searchmore{
  max-width: 1376px;
  margin: 0 auto;
  font-size: 16px;
  padding-top: 48px;
  width: calc(100vw - 96px);
}
.arrowlogo{
  width: 9px;
  height: 14px;
  margin-left: 8px;
}
.teamlogo{
  width: 128px;
  height: 174px;
  /* margin-left: 48px; */
  /* margin-top: 85px; */
}
.teamcards{
  width: calc(100vw - 144px - 128px);
  max-width: 1200px;
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
  display: inline-block;
  margin-left: 24px;
}
.allcards{
  max-width: 1376px;
  margin: 0 auto;
  padding-top: 8px;
  width: calc(100vw - 96px);
}
</style>