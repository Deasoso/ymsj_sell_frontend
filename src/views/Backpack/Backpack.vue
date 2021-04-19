<template>
  <div>
    <section class="is-cover allheight backpic">
      <!-- Main container -->
      <div class="blackhead">
      </div>
        <nav class="level sellhead" style="margin-bottom: 36px;">
          <!-- Left side -->
          <div class="level-left">
            <div class="level-item">
              <span class="teamtext">{{$t('阵营')}}</span>
              <b-select v-model="selectteam" style="margin-left: 12px;" @input="refreshCard">
                <option
                  v-for="data in teamoptions"
                  :value="data.value"
                  :key="data.value">
                  {{ data.label }}
                </option>
              </b-select>
            </div>
            <div class="level-item">
              <span class="teamtext2">AP</span>
              <b-select v-model="selectap" style="margin-left: 12px;" @input="refreshCard">
                <option
                  v-for="data in apoptions"
                  :value="data.value"
                  :key="data.value">
                  {{ data.label }}
                </option>
              </b-select>
            </div>
            <div class="level-item">
              <span class="teamtext3">DP</span>
              <b-select v-model="selectdp" style="margin-left: 12px;" @input="refreshCard">
                <option
                  v-for="data in dpoptions"
                  :value="data.value"
                  :key="data.value">
                  {{ data.label }}
                </option>
              </b-select>
            </div>
          </div>

          <!-- Right side -->
          <div class="level-right">
            <div class="level-item">
              <b-select v-model="selecttype" style="margin-left: 12px;" @input="refreshCard">
                <option
                  v-for="data in typeoptions"
                  :value="data.value"
                  :key="data.value">
                  {{ data.label }}
                </option>
              </b-select>
            </div>
            <div class="level-item">
              <div class="field has-addons">
                <b-autocomplete
                  rounded
                  v-model="searchname"
                  :data="filteredDataArray"
                  :placeholder="$t('输入要搜索的卡牌名称')"
                  clearable
                  @select="option => {searchedname=option;refreshCard()}">
                    <template #empty>No results found</template>
                </b-autocomplete>
                <button class="button searchbutton" @click="refreshCard">
                  <span class="icon searchicon">
                    <img src="http://ymsjimg.deaso40.com/sellcards_slices/search.png" />
                  </span>
                </button>
              </div>
            </div>
          </div>
        </nav>
      <!-- </div> -->
      <div class="sellcards">
        <a v-for="(item, index) in showcards" :key="index">
          <img class="onecard" @click="$router.push('/CardDetail?id=' + item.id)" :src="drawablecards[item.id].url"/>
        </a>
      </div>
    </section>
    <b-loading v-model="$store.state.cardNotGot"></b-loading>
  </div>
</template>

<script>
import drawablecards from '@/util/constants/drawablecards'
import cardfactions from '@/util/constants/cardfactions'

export default {
  data () {
    return {
      cards: [],
      showcards: [],
      drawablecards: drawablecards,
      cardfactions: cardfactions,
      searchnames: [],
      searchname: '',
      searchedname: '',
      teamoptions: [{ label: this.$t('全部阵营'), value: 'all' }],
      apoptions: [{ label: this.$t('全部费用'), value: 'all' }],
      dpoptions: [{ label: this.$t('全部防御'), value: 'all' }],
      typeoptions: [{ label: this.$t('全部类型'), value: 'all' }],
      selectteam: 'all',
      selectap: 'all',
      selectdp: 'all',
      selecttype: 'all'
    }
  },
  computed: {
    filteredDataArray () {
      return this.searchnames.filter((option) => {
        return option
          .toString()
          .toLowerCase()
          .indexOf(this.searchname.toLowerCase()) >= 0
      })
    }
  },
  watch: {
    '$store.state.cards': function (newValue, oldValue) {
      this.cards = newValue
      this.refreshCard()
    }
  },
  methods: {
    getCartType (index) {
      return index == 0 ? this.$t('地区') : index == 1 ? this.$t('角色') : index == 2 ? this.$t('事务') : index == 3 ? this.$t('秘社') : this.$t('附属')
    },
    getSearchNames () {
      var names = []
      drawablecards.filter(item => {
        names.push(item.name)
      })
      this.searchnames = names
    },
    refreshOption () {
      this.teamoptions = [{ label: this.$t('全部阵营'), value: 'all' }]
      this.apoptions = [{ label: this.$t('全部费用'), value: 'all' }]
      this.dpoptions = [{ label: this.$t('全部防御'), value: 'all' }]
      this.typeoptions = [{ label: this.$t('全部类型'), value: 'all' }]
      for (var i in drawablecards) {
        if ((this.teamoptions.filter(item => item.value == drawablecards[i].factions)).length <= 0) {
          this.teamoptions.push({
            label: cardfactions[drawablecards[i].factions].name,
            value: drawablecards[i].factions
          })
        }
        if ((this.apoptions.filter(item => item.value == drawablecards[i].cost)).length <= 0) {
          this.apoptions.push({
            label: drawablecards[i].cost,
            value: drawablecards[i].cost
          })
        }
        if ((this.dpoptions.filter(item => item.value == drawablecards[i].def)).length <= 0) {
          this.dpoptions.push({
            label: drawablecards[i].def,
            value: drawablecards[i].def
          })
        }
        if ((this.typeoptions.filter(item => item.value == drawablecards[i].type)).length <= 0) {
          this.typeoptions.push({
            label: this.getCartType(drawablecards[i].type),
            value: drawablecards[i].type
          })
        }
      }
    },
    refreshCard () {
      this.showcards = this.cards.filter(item => {
        if (this.searchname && this.searchname != '' && drawablecards[item.id].name.indexOf(this.searchname) == -1) return false
        if (this.searchedname && this.searchedname != '' && drawablecards[item.id].name != this.searchedname) return false
        if (this.selectteam != 'all' && this.selectteam != drawablecards[item.id].factions) return false
        if (this.selectap != 'all' && this.selectap != drawablecards[item.id].cost) return false
        if (this.selectdp != 'all' && this.selectdp != drawablecards[item.id].def) return false
        if (this.selecttype != 'all' && this.selecttype != drawablecards[item.id].type) return false
        return true
      })
    }
  },
  mounted () {
    this.getSearchNames()
    this.refreshOption()
    this.cards = this.$store.state.cards
    this.refreshCard()
  }
}
</script>

<style scoped>
.backpic{
  background-image: url("http://ymsjimg.deaso40.com/allcards_slices/bgi7.png");
  background-size: 100% auto;
  background-position: center;
  margin-top: 80px;
}
.allheight{
  min-height: 1000px;
  padding-bottom: 48px;
}
.sellhead{
  margin: 0 auto;
  width: calc(100vw - 48px);
  max-width: 1376px;
  margin-top: -60px;
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
  margin-left: 12px;
  color: #FFFFFF;
  font-size: 16px;
}
.teamtext3{
  margin-left: 12px;
  color: #FFFFFF;
  font-size: 16px;
}
.blackhead{
  background-color: #00000080;
  width: 100vw;
  height: 80px;
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
