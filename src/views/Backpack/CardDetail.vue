<template>
  <div>
    <section class="is-cover allheight backpic">
      <nav class="level sharehead" style="margin-bottom: 4px;">
        <div class="level-left">
          <!-- 左边没有东西 -->
        </div>
        <div class="level-right">
          <b-button type="is-dark" inverted outlined class="sharebutton"
            style="border-color: #B2B2B2;color: #000000;"
            @click="share">
            <img class="shareicon" src="http://ymsjimg.deaso40.com/shop_slices/share.png">
            <span>{{$t('分享卡牌')}}</span>
          </b-button>
          <button v-if="havecard" class="button is-dark newexchange" @click="modalactive=true">
            <span class="icon">
              <img src="http://ymsjimg.deaso40.com/sellcards_slices/trade.png">
            </span>
            <span>{{$t('新建交易')}}</span>
          </button>
        </div>
      </nav>
      <img class="cardimg" :src="cardData.url">
      <div v-if="havecard">
        <b-button type="is-dark" inverted outlined class="havebutton" style="border-color: #44D7B6;color: #15AD8B;">{{$t('已拥有')}}</b-button>
      </div>
      <div v-else>
        <b-button type="is-dark" inverted outlined class="havebutton" style="border-color: #bbbbbb;color: #bbbbbb;">{{$t('未拥有')}}</b-button>
      </div>
      <div class="cardname">
        {{cardData.name}}
      </div>
      <div class="cardtype">
        {{getCartType(cardData.type)}}·{{getChildTypes(cardData.childType)}}
      </div>
      <div class="teamtypes">
        <div class="teamtype">
          <img class="teamicon" :src="cardfactions[cardData.factions].url">
          <div class="teamname">{{$t('阵营')}}</div>
        </div>
        <div class="teamtype">
          <img class="teamicon" src="http://ymsjimg.deaso40.com/types/费用背景.png">
          <div class="costtext">{{cardData.cost}}</div>
          <div class="teamname">AP</div>
        </div>
        <div class="teamtype">
          <img class="teamicon" src="http://ymsjimg.deaso40.com/types/defImg.png">
          <div class="deftext">{{cardData.def}}</div>
          <div class="teamname">DP</div>
        </div>
        <div class="teamtype">
          <div class="attrs">
            <img v-for="index in cardData.whiteSpyNum" :key="index" class="attr" src="http://ymsjimg.deaso40.com/types/attr_eye_white.png">
            <img v-for="index in cardData.whiteBattleNum" :key="index" class="attr" src="http://ymsjimg.deaso40.com/types/attr_battle_white.png">
            <img v-for="index in cardData.whitePowerNum" :key="index" class="attr" src="http://ymsjimg.deaso40.com/types/attr_power_white.png">
            <img v-for="index in cardData.blackSpyNum" :key="index" class="attr" src="http://ymsjimg.deaso40.com/types/attr_eye.png">
            <img v-for="index in cardData.blackBattleNum" :key="index" class="attr" src="http://ymsjimg.deaso40.com/types/attr_battle.png">
            <img v-for="index in cardData.blackPowerNum" :key="index" class="attr" src="http://ymsjimg.deaso40.com/types/attr_power.png">
            <div class="attrbottom" />
            <div class="teamname">{{$t('属性')}}</div>
          </div>
        </div>
        <div class="description">
          <img class="descriptionicon" src="http://ymsjimg.deaso40.com/backpack_slices/skill.png">
          <div class="descriptionname">{{$t('技能')}}</div>
          <div class="descriptiontext">
            <vue-scroll>
              {{cardData.skillInfo || $t('无')}}
            </vue-scroll>
          </div>
        </div>
        <div class="description">
          <img class="descriptionicon" src="http://ymsjimg.deaso40.com/backpack_slices/man.png">
          <div class="descriptionname">{{$t('简介')}}</div>
          <div class="descriptiontext">
            <vue-scroll>
              {{cardData.bgStory || $t('无')}}
            </vue-scroll>
          </div>
        </div>
      </div>
    </section>
    <sell-modal :modalactive.sync="modalactive" />
  </div>
</template>

<script>
import SellModal from './SellModal'
import drawablecards from '@/util/constants/drawablecards'
import cardfactions from '@/util/constants/cardfactions'
import childtypes from '@/util/constants/childtypes'

export default {
  data () {
    return {
      modalactive: false,
      cardData: drawablecards[0],
      cardfactions: cardfactions
    }
  },
  computed: {
    havecard () {
      const arr = this.$store.state.cards.filter(item => {
        return item.id == this.cardData.id
      })
      return arr.length > 0
    }
  },
  components: {
    SellModal
  },
  mounted () {
    this.cardData = drawablecards[this.$route.query.id]
  },
  methods: {
    // getCardType:
    // ConstCartType.AREA = 0;
    // ConstCartType.ACTOR = 1;
    // ConstCartType.AFFAIR = 2;
    // ConstCartType.SECRET_CIRCLE = 3;
    // ConstCartType.SECRET_ADD = 4;
    // 地区牌/角色牌/事务牌/秘社牌/附属牌
    getCartType (index) {
      return index == 0 ? this.$t('地区') : index == 1 ? this.$t('角色') : index == 2 ? this.$t('事务') : index == 3 ? this.$t('秘社') : this.$t('附属')
    },
    getChildTypes (inputtypes) {
      var str = ''
      for (var i in inputtypes) {
        if (i == 0) {
          str += childtypes[inputtypes[i]].name
        } else {
          str += ('/' + childtypes[inputtypes[i]].name)
        }
      }
      return str
    },
    share () {
      const _this = this
      this.$copyText(location.href).then(
        function (e) {
          _this.$buefy.dialog.alert({
            title: this.$t('已复制'),
            message: this.$t('邀请链接已复制到剪切板！'),
            confirmText: this.$t('确认')
          })
        },
        function (e) {
          _this.$buefy.dialog.alert({
            title: this.$t('复制失败'),
            message: this.$t('邀请链接复制失败，尝试手动复制？'),
            confirmText: this.$t('确认')
          })
        }
      )
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
  min-height: 1060px;
  padding-bottom: 48px;
}
.sharehead{
  max-width: 800px;
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
  max-width: 800px;
  text-align: center;
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
  height: auto;
}
.teamname{
  font-size: 16px;
  color: #333333;
}
.costtext{
  font-size: 30px;
  font-weight: bolder;
  margin-top: -52px;
  margin-bottom: 10px;
}
.deftext{
  font-size: 30px;
  font-weight: bolder;
  color: #ffffff;
  margin-top: -62px;
  margin-bottom: 18px;
}
.attrs{
  width: 48px;
  height: 82px;
  line-height: 0;
}
.attr{
  width: 20px;
  height: 20px;
  margin: 2px;
}
.attrbottom{
  margin-top: 16px;
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
}
</style>
