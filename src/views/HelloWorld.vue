<template>
  <div class="hello">
    <section class="hero is-cover is-fullheight backpic">
      <div class="hero-body">
        <div class="container">
          <h1 class="title whiteborder">
            司令の殿
          </h1>
          <h2 class="subtitle whiteborder">
            - A Little Site of Deaso -
          </h2>
        </div>
      </div>
    </section>
    <img src="../assets/line/line1.jpg">
    <!-- <projects /> -->
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
// .hello{
//   margin: 10%;
//   width: 80%;
// }

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
.gotoDetail {
  background-image: #ff0000;
  background-size: cover;
  height: 50px;
  width: 130px;
  background-color: transparent;
  border-color: transparent;
  color: #3a2729;
}
.backpic{
  background-image: url("../assets/bigback.jpg");
}
.whiteborder{
  text-shadow:5px 2px 6px #000000;
  color: #ffffff
}
</style>
