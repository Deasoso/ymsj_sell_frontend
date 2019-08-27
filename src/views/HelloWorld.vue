<template>
  <div class="hello">
    <section class="hero is-cover is-fullheight">
      <slider class="sliderContainer" animation="normal" height="none" style="position: inherit">
        <slider-item>
          <div class="slide slide1">
            <div class="slideContainer">
              <span class="slidetext slidetitle">有机盆栽蔬菜基地</span>
              <p class="slidetext">基地地点位于娄底市娄星区水洞底镇西溪村和慕隆村，孙水河畔，无工业污染，占地500亩。项目已经在水洞底镇西溪村和慕隆村流转土地500亩，主要做好500亩有机盆栽蔬菜种植基地建设、包括土地流转、土地整理、土壤改良、种苗订购、规划设计、技术培训、连栋大棚建设和机耕道、灌溉系统、供电等基础设施建设。</p>
              <br>
              <div class="btndiv">
                <router-link class="button is-medium gotoDetail" :to="{ name: 'PreSale' }">了解详情</router-link>
              </div>
            </div>
          </div>
        </slider-item>
        <slider-item>
          <div class="slide slide2">
            <div class="slideContainer">
              <span class="slidetext slidetitle">茶油种植基地</span>
              <p class="slidetext">基地位于湖南省涟源市，涟源属大陆性中亚热带大陆性季风湿润气候区，热量丰富，温度适宜，冬季少严寒，而恰好油茶的生长习性是喜温暖，怕寒冷，所以在涟源种植油茶有着得天独厚的地理优势。目前我们的茶油种植基地有三百多亩的生产规模，将近四万颗茶油树。按照一棵树产一斤茶油来算，我们的基地一年可以生产四万斤的茶油。与目前市场上的众多调和油相比，在制作工艺方面，我们采取传统的生产方式，是纯天然的茶油，成分达到100%，无任何其他掺杂成分，保质期长达10年之久。</p>
              <br>
              <div class="btndiv">
                <router-link class="button is-medium gotoDetail" :to="{ name: 'Game' }">了解详情</router-link>
              </div>
            </div>
          </div>
        </slider-item>
        <slider-item>
          <div class="slide slide3">
            <div class="slideContainer">
              <span class="slidetext slidetitle">中药材种植基地</span>
              <p class="slidetext">基地位于湖南省涟源市，地属大陆性中亚热带季风湿润气候，温度适宜、降水量较多，低温冻害和连阴雨影响偏轻、干旱范围小，地形以山地丘陵为主，有较多开阔的缓坡，土壤条件较好。中药材如玉竹等的生长习性为喜阴湿环境，较耐寒，适宜在湿润疏松、富含腐殖质的黄沙土或棕壤土中生长，所以涟源市的气候土壤环境很适合如玉竹等中药材的生长。目前我们的中药材种植基地占地300多亩，主要种植****，具有较高的药用价值，与市场上其他中药材种植基地相比，我们采取下单实地采摘的模式，保证中药材的新鲜度，一年四季我们都将会有中药材的提供以满足客户的需求。</p>
            </div>
          </div>
        </slider-item>
      </slider>
    </section>
    <projects />
    <students />
  </div>
</template>

<script>
import { Slider, SliderItem } from 'vue-easy-slider';
import Students from './Sections/Students';
import Projects from './Sections/Projects';

export default {
  name: 'HelloWorld',
  components: {
    Slider,
    SliderItem,
    Students,
    Projects
  },
  props: {
    msg: String
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style lang="scss" scoped>
.hello{
  margin: 10%;
  width: 80%;
}

h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
/*
  section 1
*/
.sliderContainer {
  width: auto;
  height: 500px;
  z-index: 0;
}
.slide {
  width: 100%;
  height: 100%;
  background-size: 100%;
  background-repeat: no-repeat;
  background-color: #000;
  display: inline-block;
  vertical-align: middle;
}
.slide1 {
  background-image: url("../assets/slide/slide1.jpg");
  background-size:cover;
  background-position-x: 50%;
  /* background-color: hsl(171, 100%, 41%); */
  /* background-size:auto; */
}
.slide2 {
  background-image: url("../assets/slide/slide2.jpg");
  background-size:cover;
  background-position-x: 50%;
  /* background-color: hsl(204, 86%, 53%) */
    /* background-size: cover; */
}
.slide3 {
  background-image: url("../assets/slide/slide3.jpg");
  background-size:cover;
  background-position-x: 50%;
  /* background-color: hsl(141, 71%, 48%); */
    /* background-size: cover; */
}
.slideContainer {
  margin-top:100px;
  margin-bottom:100px;
  margin-left: 5%;
  padding: 30px;
  width: 90%;
  height: calc(100% - 200px);
  background-color: #ffffff33;
  text-align: left;
  /*opacity: 0.5;*/
}
.slidetext {
  color: #000;
  font-size: 20px;
}
.slidetitle {
  font-size: 40px;
}
.gotoDetail {
  background-image: #ff0000;
  background-size: cover;
  height: 50px;
  width: 130px;
  background-color: transparent;
  border-color: transparent;
  color: #3a2729;
}
</style>
