<template>
  <div>
    <section class="hero is-cover allheight backpic">
      <!-- <div class="hero-body"> -->
        <div class="container toleft">
          <div class="titlepos whiteborder">
            <div class="titletext">科学与魔法并存，这里有引人入胜的世界观...</div>
          </div>
          <div class="subtitlepos whiteborder">
            <div class="subtitletext">这是一段简介… …这是一段简介… …这是一段简介… …这是一段简介… …这是一段简介… …这是一段简介… …这是一段简介… …这是一段简介… …这是一段简介… …这是一段简介… …这是一段简介… …这是一段简介… …</div>
          </div>
          <div class="textbackpos">
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
          <div class="buttonpos goldbuttonback">
            <a class="buttontext">立即前往</a>
          </div>
        </div>
      <!-- </div> -->
    </section>
  </div>
</template>

<style scoped>
.backpic{
  background-image: url("../assets/title_slices/bgi3.png");
  background-size: auto 100%;
  background-position: left;
  margin-top: -32px;
}
.whiteborder{
  text-shadow:5px 2px 6px #000000;
  color: #ffffff;
}
.ymsjlogo{
  width: 472px;
  height: 200px;
}
.goldbuttonback{
  background-size: 100% 100%;
  background-image: url("../assets/title_slices/button1.png");
  width: 178px;
  height: 40px;
  padding-top: 8px;
  margin-top: -22px;
  margin-left: 600px;
  text-align: center;
}
.buttontext{
  color: #773f05;
  font-size: 14px;
  font-weight: bold;
}
.allheight{
  height: 560px;
}
.titletext{
  font-size: 36px;
  color: #E7CE8A;
}
.subtitletext{
  font-size: 14px;
}
.titlepos{
  margin-top: 119px;
  margin-left: 0px;
  width: 800px;
}
.subtitlepos{
  margin-top: 8px;
  width: 800px;
}
.toleft{
  margin-left: calc(1000px - (1920px - 100vw));
  text-align: left;
}
.textbackpos{
  margin-top: 24px;
  width: 800px;
  height: 200px;
  background-color: #f1f1f1;
  padding: 24px;
  border-style: outset;
  border-width: 5px;
  border-color: #E7C874;
}
.intext{
  color: #000000;
  font-size: 14px;
  
}
</style>
