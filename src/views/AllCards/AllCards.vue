<template>
  <div>
    <section class="is-cover allheight backpic">
      <div v-for="(item, index) in cardfactions" :key="index">
        <div class="searchmore">
          <nav class="level" style="margin-bottom: 0px;">
            <div class="level-left">
            </div>
            <div class="level-right" @click="$router.push('/Backpack')" style="cursor: pointer;">{{$t('查看更多')}}<img class="arrowlogo" src="http://ymsjimg.deaso40.com/allcards_slices/goto.png">
            </div>
          </nav>
        </div>
        <div class="allcards">
          <nav class="level">
            <div class="level-left">
              <img class="teamlogo" :src="item.url">
              <div class="teamtext">{{item.name}}</div>
            </div>
            <div class="level-right">
              <div class="teamcards">
                <vue-scroll :ops="ops">
                  <div :style="getCardsWidth(getCardsByType(item.id))">
                    <span v-for="(card,index2) in getCardsByType(item.id)" :key="index2">
                      <img class="teamcard1" v-if="index2 == 0" @click="enterDetail(card.arrid)" :src="card.url">
                      <img class="teamcard" v-else @click="enterDetail(card.arrid)" :src="card.url">
                    </span>
                  </div>
                </vue-scroll>
              </div>
            </div>
          </nav>
        </div>
      </div>
      <div class="searchmore">
        <nav class="level">
          <div class="level-left">
          </div>
          <div class="level-right" @click="$router.push('/Backpack')">{{$t('查看更多')}}<img class="arrowlogo" src="http://ymsjimg.deaso40.com/allcards_slices/goto.png">
          </div>
        </nav>
      </div>
    </section>
  </div>
</template>

<script>
// import allcards from '@/util/constants/allcards'
import drawablecards from '@/util/constants/drawablecards'
import cardfactions from '@/util/constants/cardfactions'

export default {
  data () {
    return {
      ops: {
        scrollPanel: {
          scrollingX: true,
          scrollingY: false
        }
      },
      cardfactions: cardfactions
    }
  },
  mounted () {
    // for (var i = 0; i < drawablecards.length; i++) {
    //   console.log(i);
    //   console.log(drawablecards[i])
    // }
    // var Data = allcards;
    // var allcards = [];
    // for (var i = 0; i < Data.length; i++) {
    //   var card = {};
    //   if (Data[i][0].indexOf("asset") != -1) {
    //     card.url = Data[i][0];
    //   } else {
    //     card.url = "http://material.kdsrpg.com/" + Data[i][0];
    //   }
    //   card.id = Data[i][1];
    //   card.type = Data[i][2];
    //   card.childType = Data[i][3];
    //   card.cost = Data[i][4];
    //   card.factions = Data[i][5];
    //   card.loyal = Data[i][6];
    //   card.name = Data[i][7].replace(/[*&@]/g, "");
    //   card.childName = Data[i][8];
    //   card.isGolden = Data[i][9];
    //   card.whiteSpyNum = Data[i][10];
    //   card.whiteBattleNum = Data[i][11];
    //   card.whitePowerNum = Data[i][12];
    //   card.blackSpyNum = Data[i][13];
    //   card.blackBattleNum = Data[i][14];
    //   card.blackPowerNum = Data[i][15];
    //   card.def = Data[i][16];
    //   card.magicAreaID = Data[i][17];
    //   card.cardNumber = Data[i][18];
    //   card.cardPainterID = Data[i][19];
    //   card.area_needWinPower = Data[i][20];
    //   card.area_score = Data[i][21];
    //   card.addType = Data[i][22];
    //   card.effectID = Data[i][23];
    //   card.limitNum = Data[i][24];
    //   card.isDebar = Data[i][25];
    //   card.screenshotPath = Data[i][26];
    //   card.rarity = Data[i][27];
    //   card.ringCenterPos = Data[i][28];
    //   card.ringRadius = parseFloat(Data[i][29]);
    //   card.bgStory = Data[i][30];
    //   card.series = Data[i][31];
    //   card.seriesID = Data[i][32];
    //   card.skillInfo = Data[i][33];
    //   allcards[card.id] = card;
    //   card.modelId = card.id;
    // }
    // console.log(allcards)
  },
  methods: {
    getCardsWidth (cards) {
      return 'width:' + ((cards.length * 256) + ((cards.length - 1) * 24)) + 'px;'
    },
    getCardsByType (id) {
      var typecards = []
      for (var index in drawablecards) {
        if (drawablecards[index].factions == id) {
          typecards.push(drawablecards[index])
        }
      }
      return typecards
    },
    enterDetail (index) {
      this.$router.push('/CardDetail?id=' + index)
    }
  }
}
</script>

<style scoped>
.backpic{
  margin-top: 80px;
  background-image: url("http://ymsjimg.deaso40.com/allcards_slices/bgi7.png");
  background-size: 100% auto;
  background-position: center;
}
.allheight{
  min-height: 1000px;
  padding-bottom: 48px;
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
.teamtext{
  margin-left: -128px;
  margin-top: 230px;
  font-size: 24px;
  font-weight: bold;
  text-align: center;
  width: 128px;
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
  cursor: pointer;
}
.teamcard{
  width: 256px;
  height: 367px;
  display: inline-block;
  margin-left: 24px;
  cursor: pointer;
}
.allcards{
  max-width: 1376px;
  margin: 0 auto;
  padding-top: 8px;
  width: calc(100vw - 96px);
}
</style>
