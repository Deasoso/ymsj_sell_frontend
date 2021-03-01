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
          <div class="buttonpos" @click="$router.push('/Shop')">
            <a><img class="goldbutton" src="@/assets/title_slices/button1.png"></a>
            <a><div class="buttontext">立即前往</div></a>
            <!-- tip Deaso: 本来想全部按钮改成img，但是后来发现加个cursor就可以所以就没弄了。 -->
          </div>
        </div>
      <!-- </div> -->
    </section>
  </div>
</template>

<style scoped>
.backpic{
  background-image: url("../../assets/title_slices/bgi3.png");
  background-size: cover;
  background-position: left;
  margin-top: -32px;
}
@media (max-width: 1920px){
  .backpic{
    background-size: auto 100%;
  }
}
.whiteborder{
  text-shadow:5px 2px 6px #000000;
  color: #ffffff;
}
.buttonpos{
  margin-top: -22px;
  margin-left: 600px;
  text-align: left;
}
.goldbutton{
  width: 178px;
  height: 40px;
}
.buttontext{
  color: #773f05;
  font-size: 14px;
  font-weight: bold;
  margin-left: 60px;
  margin-top: -38px;
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
