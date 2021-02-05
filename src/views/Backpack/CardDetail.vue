<template>
  <div>
    <section class="is-cover allheight backpic">
      <nav class="level sharehead" style="margin-bottom: 4px;">
        <div class="level-left">
          <!-- 左边没有东西 -->
        </div>
        <div class="level-right">
          <b-button type="is-dark" inverted outlined class="sharebutton" style="border-color: #B2B2B2;color: #000000;">
            <img class="shareicon" src="../../assets/shop_slices/share.png">
            <span>分享卡牌</span>
          </b-button>
          <button class="button is-dark newexchange">
            <span class="icon">
              <img src="../../assets/sellcards_slices/trade.png">
            </span>
            <span>新建交易</span>
          </button>
        </div>
      </nav>
      <img class="cardimg" src="../../assets/title_slices/bgi1.png">
      <div>
        <b-button type="is-dark" inverted outlined class="havebutton" style="border-color: #44D7B6;color: #15AD8B;">
          已拥有
        </b-button>
      </div>
      <div class="cardname">
        新生血族
      </div>
      <div class="cardtype">
        角色·吸血鬼
      </div>
      <div class="teamtypes">
        <div class="teamtype">
          <img class="teamicon" src="../../assets/title_slices/bgi1.png">
          <div class="teamname">阵营</div>
        </div>
        <div class="teamtype">
          <img class="teamicon" src="../../assets/title_slices/bgi1.png">
          <div class="teamname">AP</div>
        </div>
        <div class="teamtype">
          <img class="teamicon" src="../../assets/title_slices/bgi1.png">
          <div class="teamname">DP</div>
        </div>
        <div class="teamtype">
          <img class="teamicon" src="../../assets/title_slices/bgi1.png">
          <div class="teamname">属性</div>
        </div>
        <div class="description">
          <img class="descriptionicon" src="../../assets/backpack_slices/skill.png">
          <div class="descriptionname">技能</div>
          <div class="descriptiontext">
            这是一段技能说明…这是一段技能说明…这是一段技能说明…这是一段技能说明…
            这是一段技能说明…这是一段技能说明…这是一段技能说明…这是一段技能说明…
            这是一段技能说明…这是一段技能说明…这是一段技能说明…这是一段技能说明…
            这是一段技能说明…这是一段技能说明…这是一段技能说明…这是一段技能说明…
            这是一段技能说明…这是一段技能说明…这是一段技能说明…这是一段技能说明…
            这是一段技能说明…这是一段技能说明…这是一段技能说明…这是一段技能说明…
            这是一段技能说明…这是一段技能说明…这是一段技能说明…这是一段技能说明…
          </div>
        </div>
        <div class="description">
          <img class="descriptionicon" src="../../assets/backpack_slices/man.png">
          <div class="descriptionname">简介</div>
          <div class="descriptiontext">
            这是一段人物简介…这是一段人物简介…这是一段人物简介…这是一段人物简介…
            这是一段人物简介…这是一段人物简介…这是一段人物简介…这是一段人物简介…
            这是一段人物简介…这是一段人物简介…这是一段人物简介…这是一段人物简介…
            这是一段人物简介…这是一段人物简介…这是一段人物简介…这是一段人物简介…
            这是一段人物简介…这是一段人物简介…这是一段人物简介…这是一段人物简介…
            这是一段人物简介…这是一段人物简介…这是一段人物简介…这是一段人物简介…
            这是一段人物简介…这是一段人物简介…这是一段人物简介…这是一段人物简介…
            这是一段人物简介…这是一段人物简介…这是一段人物简介…这是一段人物简介…
          </div>
        </div>
      </div>
    </section>
    <b-button
      label="Launch card modal (keep scroll)"
      type="is-primary"
      size="is-medium"
      @click="modalactive = true" />
    <sell-modal :modalactive.sync="modalactive" />
  </div>
</template>

<script>
import SellModal from './SellModal'

export default {
	data(){
		return{
      modalactive: true
		}
  },
  components:{
    SellModal
  }
};
</script>

<style scoped>
.backpic{
  margin-top: 80px;
  background-image: url("../../assets/allcards_slices/bgi7.png");
  background-size: auto 100%;
  background-position: center;
}
.allheight{
  height: 1060px;
}
.sharehead{
  width: 800px;
  margin: 0 auto;
  padding-top: 48px;
}
.sharebutton{
  font-size: 14px;
  width: 120px;
  height: 40px;
}
.shareicon{
  margin-top: 3px;
  margin-right: 5px;
  width: 16px;
  height: 16px;
}
.newexchange{
  margin-left: 16px;
  width: 120px;
  height: 40px;
}
.cardimg{
  margin: 0 auto;
  margin-top: 24px;
  width: 256px;
  height: 366px;
}
.havebutton{
  margin: 0 auto;
  margin-top: 24px;
  width: 72px;
  height: 24px;
  font-size: 14px;
  padding-bottom: 6px;
}
.cardname{
  font-size: 36px;
  font-weight: bold;
}
.cardtype{
  font-size: 16px;
  color: #888888;
}
.teamtypes{
  text-align: center;
  width: 800px;
  margin: 0 auto;
}
.teamtype{
  display: inline-block;
  margin: 24px;
  margin-bottom: 0px;
  width: 48px;
  height: 82px;
}
.teamicon{
  width: 48px;
  height: 48px;
}
.teamname{
  font-size: 16px;
  color: #333333;
}
.description{
  text-align: left;
  max-width: 848px;
  margin: 0 auto;
  margin-top: 24px;
  padding-left: 24px;
  padding-right: 24px;
}
.descriptionicon{
  width: 16px;
  height: 16px;
}
.descriptionname{
  font-size: 16px;
  color: #333333;
  margin-top: -26px;
  margin-left: 20px;
}
.descriptiontext{
  margin-top: 10px;
  font-size: 14px;
  height: 96px;
  overflow: scroll;
}
</style>
