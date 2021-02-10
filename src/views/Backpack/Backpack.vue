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
              <b-select v-model="selectteam" style="margin-left: 12px;">
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
              <b-select v-model="selectap" style="margin-left: 12px;">
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
              <b-select v-model="selectdp" style="margin-left: 12px;">
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
              <b-select v-model="selecttype" style="margin-left: 12px;">
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
                <input class="input searchinput" type="text" placeholder="输入你想搜索的卡牌名称">
                <button class="button searchbutton">
                  <span class="icon searchicon">
                    <img src="../../assets/sellcards_slices/search.png" />
                  </span>
                </button>
              </div>
            </div>
          </div>
        </nav>
      </div>
      <div class="sellcards">
        <a v-for="(item, index) in showcards" :key="index">
          <img class="onecard" @click="$router.push('/CardDetail?id=' + item.id)" :src="drawablecards[item.id].url"/>
        </a>
      </div>
    </section>
  </div>
</template>

<script>
import usercards from '@/assets/fakedatas/usercards';
import drawablecards from '@/util/drawablecards';
import cardfactions from '@/util/cardfactions';

export default {
	data(){
		return{
      showcards: usercards,
      drawablecards: drawablecards,
      teamoptions: [{label: '全部阵营', value: 'all'}],
      apoptions: [{label: '全部费用', value: 'all'}],
      dpoptions: [{label: '全部防御', value: 'all'}],
      typeoptions: [{label: '全部类型', value: 'all'}],
      selectteam: 'all',
      selectap: 'all',
      selectdp: 'all',
      selecttype: 'all',
		}
  },
  methods:{
    getCartType(index){
      return index == 0 ? '地区' : index == 1 ? '角色' : index == 2 ? '事务' : index == 3 ? '秘社' : '附属';
    },
    refreshOption(){
      this.teamoptions = [{label: '全部阵营', value: 'all'}];
      this.apoptions = [{label: '全部费用', value: 'all'}];
      this.dpoptions = [{label: '全部防御', value: 'all'}];
      this.typeoptions = [{label: '全部类型', value: 'all'}];
      for(var i in drawablecards){
        if((this.teamoptions.filter(item => item.value == drawablecards[i].factions)).length <= 0){
          this.teamoptions.push({
            label: cardfactions[drawablecards[i].factions].name,
            value: drawablecards[i].factions
          })
        }
        if((this.apoptions.filter(item => item.value == drawablecards[i].cost)).length <= 0){
          this.apoptions.push({
            label: drawablecards[i].cost,
            value: drawablecards[i].cost
          })
        }
        if((this.dpoptions.filter(item => item.value == drawablecards[i].def)).length <= 0){
          this.dpoptions.push({
            label: drawablecards[i].def,
            value: drawablecards[i].def
          })
        }
        if((this.typeoptions.filter(item => item.value == drawablecards[i].type)).length <= 0){
          this.typeoptions.push({
            label: this.getCartType(drawablecards[i].type),
            value: drawablecards[i].type
          })
        }
      }
    },
    refreshCard(){
      
    },
  },
  mounted(){
    this.refreshOption();
  }
};
</script>

<style scoped>
.backpic{
  background-image: url("../../assets/allcards_slices/bgi7.png");
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
  height: 80px;
  overflow-x: hidden;
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
