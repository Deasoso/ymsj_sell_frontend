<template>
  <div class="hello">
    <section class="hero is-cover is-success is-fullheight">
      <slider class="sliderContainer" animation="normal" height="none" style="position: unset">
        <slider-item>
          <div class="slide slide1">
            <div class="slideContainer">
              <span class="slidetext slidetitle">标题</span>
              <p class="slidetext">副标题</p>
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
              <span class="slidetext slidetitle">标题</span>
              <p class="slidetext">副标题</p>
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
              <span class="slidetext slidetitle">更多内容</span>
              <p class="slidetext">敬请期待。</p>
            </div>
          </div>
        </slider-item>
      </slider>
    </section>
    <projects />
    <students />
    <div class="wow slideInLeft">1<br/></div>
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
<style scoped>
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
