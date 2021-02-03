<template>
  <div>
    <section class="hero is-cover allheight backpic">
      <div class="container toleft">
        <div class="textback">
          <slider class="sliderContainer" animation="fade" :autoplay="false" style="height:400px;" :indicators="false" :control-btn="false">
            <slider-item>
              <div class="slideContainer">
                <div class="titlepos whiteborder">
                  <img class="speakerlogo" src="../../assets/title_slices/avatar备份.png">
                </div>
                <div class="subtitlepos whiteborder">
                  <div class="subtitletext">HideoKojima</div>
                </div>
                <div class="intextpos whiteborder">
                  <div class="intext">
                    这是一段简介… …这是一段简介… …这是一段简介… …这是一段简介… …这是一段简介… …
                    这是一段简介… …这是一段简介… …这是一段简介… …这是一段简介… …这是一段简介… …
                    这是一段简介… …这是一段简介… …这是一段简介… …这是一段简介… …这是一段简介… …
                    这是一段简介… …这是一段简介… …这是一段简介… …这是一段简介… …这是一段简介… …
                    这是一段简介… …这是一段简介… …这是一段简介… …这是一段简介… …这是一段简介… …
                    这是一段简介… …这是一段简介… …这是一段简介… …这是一段简介… …这是一段简介… …
                    这是一段简介… …这是一段简介… …这是一段简介… …这是一段简介… …这是一段简介… …
                  </div>
                </div>
              </div>
            </slider-item>
            <slider-item>
              <div class="slideContainer">
                3125123
              </div>
            </slider-item>
            <slider-item>
              <div class="slideContainer">
                12312412
              </div>
            </slider-item>
          </slider>
          <div class="buttonpos">
            <div class="changebuttons">
              <div class="changebuttonpos1">
                <button class="button is-ghost changebutton">
                </button>
              </div>
              <div class="changebuttonpos2">
                <button class="button is-ghost changebutton">
                </button>
              </div>
              <div class="changebuttonpos3">
                <button class="button is-ghost changebutton">
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>
<script>
import { Slider, SliderItem } from 'vue-easy-slider';

export default {
  components: {
    Slider,
    SliderItem
  }
}
</script>
<style scoped>
.backpic{
  background-image: url("../../assets/title_slices/bgi5.png");
  background-size: auto 100%;
  background-position: left;
}
.whiteborder{
  text-shadow:5px 2px 6px #000000;
  color: #ffffff;
}
.speakerlogo{
  width: 64px;
  height: 64px;
  margin: 0 auto;
  border-radius: 0px;
}
.goldbuttonback{
  background-size: 100% 100%;
  background-image: url("../../assets/title_slices/button1.png");
  width: 178px;
  height: 40px;
  padding-top: 8px;
  margin-top: -15px;
  margin-left: 600px;
}
.buttontext{
  color: #773f05;
  font-size: 14px;
  font-weight: bold;
}
.allheight{
  height: 840px;
}
.titletext{
  font-size: 36px;
  color: #E7CE8A;
}
.subtitletext{
  font-size: 16px;
  color: #F4CF1F;
}
.titlepos{
  margin-top: 48px;
}
.subtitlepos{
  margin-top: 8px;
}
.intextpos{
  margin-top: 24px;
  text-align: left;
}
.toleft{
  margin-left: calc(1000px - (1920px - 100vw));
}
.textback{
  margin-top: 204px;
  width: 800px;
  height: 400px;
  background-color: #000000b3;
  border-style: outset;
  border-width: 5px;
  border-color: #E7C874;
  text-align: center;
}
.intext{
  color: #ffffff;
  font-size: 14px;
  padding-left: 24px;
  padding-right: 24px;
}
.sliderContainer {
  width: 100%;
  height: 999px;
}
.slider-indicator-icon{
  width: 80px;
  height: 8px;
  background-color: #E7CE8A;
}
.buttonpos{
  margin-top: 24px;
}
.changebuttons{
  margin: 0 auto;
  width: 288px;
  height: 8px;
}
.changebuttonpos1{
  text-align:left;
}
.changebuttonpos2{
  margin-top: -24px;
  text-align: center;
}
.changebuttonpos3{
  margin-top: -24px;
  text-align: right;
}
.changebutton{
  background-color: #E7CE8A;
  width: 80px;
  height: 8px;
  padding: 0px;
  border-radius: 0px;
  border: 0px;
}
</style>
