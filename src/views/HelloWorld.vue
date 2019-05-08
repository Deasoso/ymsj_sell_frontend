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
    <div class="columns cardcontainer">
      <div class="column onecard wow slideInUp">
        <div class="card">
          <div class="card-image">
            <figure class="image is-4by3">
              <img src="https://bulma.io/images/placeholders/1280x960.png" alt="Placeholder image">
            </figure>
          </div>
          <div class="card-content">
            <div class="media">
              <div class="media-left">
                <figure class="image is-48x48">
                  <img src="https://bulma.io/images/placeholders/96x96.png" alt="Placeholder image">
                </figure>
              </div>
              <div class="media-content">
                <p class="title is-4">John Smith</p>
                <p class="subtitle is-6">@johnsmith</p>
              </div>
            </div>

            <div class="content">
              Lorem ipsum dolor sit amet, consectetur adipiscing elit.
              Phasellus nec iaculis mauris. <a>@bulmaio</a>.
              <a href="#">#css</a> <a href="#">#responsive</a>
              <br>
              <time datetime="2016-1-1">11:09 PM - 1 Jan 2016</time>
            </div>
          </div>
        </div>
      </div>
      <div class="column twocard wow slideInUp" data-wow-delay="0.3s">
        <div class="card">
          <div class="card-image">
            <figure class="image is-4by3">
              <img src="https://bulma.io/images/placeholders/1280x960.png" alt="Placeholder image">
            </figure>
          </div>
          <div class="card-content">
            <div class="media">
              <div class="media-left">
                <figure class="image is-48x48">
                  <img src="https://bulma.io/images/placeholders/96x96.png" alt="Placeholder image">
                </figure>
              </div>
              <div class="media-content">
                <p class="title is-4">John Smith</p>
                <p class="subtitle is-6">@johnsmith</p>
              </div>
            </div>

            <div class="content">
              Lorem ipsum dolor sit amet, consectetur adipiscing elit.
              Phasellus nec iaculis mauris. <a>@bulmaio</a>.
              <a href="#">#css</a> <a href="#">#responsive</a>
              <br>
              <time datetime="2016-1-1">11:09 PM - 1 Jan 2016</time>
            </div>
          </div>
        </div>
      </div>
      <div class="column threecard wow slideInUp" data-wow-delay="0.6s">
        <div class="card">
          <div class="card-image">
            <figure class="image is-4by3">
              <img src="https://bulma.io/images/placeholders/1280x960.png" alt="Placeholder image">
            </figure>
          </div>
          <div class="card-content">
            <div class="media">
              <div class="media-left">
                <figure class="image is-48x48">
                  <img src="https://bulma.io/images/placeholders/96x96.png" alt="Placeholder image">
                </figure>
              </div>
              <div class="media-content">
                <p class="title is-4">John Smith</p>
                <p class="subtitle is-6">@johnsmith</p>
              </div>
            </div>

            <div class="content">
              Lorem ipsum dolor sit amet, consectetur adipiscing elit.
              Phasellus nec iaculis mauris. <a>@bulmaio</a>.
              <a href="#">#css</a> <a href="#">#responsive</a>
              <br>
              <time datetime="2016-1-1">11:09 PM - 1 Jan 2016</time>
            </div>
          </div>
        </div>
      </div>
      <div class="column fourcard wow slideInUp" data-wow-delay="0.9s">
        <div class="card">
          <div class="card-image">
            <figure class="image is-4by3">
              <img src="https://bulma.io/images/placeholders/1280x960.png" alt="Placeholder image">
            </figure>
          </div>
          <div class="card-content">
            <div class="media">
              <div class="media-left">
                <figure class="image is-48x48">
                  <img src="https://bulma.io/images/placeholders/96x96.png" alt="Placeholder image">
                </figure>
              </div>
              <div class="media-content">
                <p class="title is-4">John Smith</p>
                <p class="subtitle is-6">@johnsmith</p>
              </div>
            </div>

            <div class="content">
              Lorem ipsum dolor sit amet, consectetur adipiscing elit.
              Phasellus nec iaculis mauris. <a>@bulmaio</a>.
              <a href="#">#css</a> <a href="#">#responsive</a>
              <br>
              <time datetime="2016-1-1">11:09 PM - 1 Jan 2016</time>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="wow slideInLeft">1<br/></div>
  </div>
</template>

<script>
import { Slider, SliderItem } from 'vue-easy-slider';

export default {
  name: 'HelloWorld',
  components: {
    Slider,
    SliderItem
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
/*
  section 2
*/
.cardcontainer{
  margin: 20px;
}
.onecard{
  margin-top: 0px;
}
.twocard{
  margin-top: 100px;
}
.threecard{
  margin-top: 0px;
}
.fourcard{
  margin-top: 100px;
}
</style>
