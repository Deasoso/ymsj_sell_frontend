<template>
  <div class="hello">
    <section class="hero is-cover allheight backpic">
      <!-- <div class="hero-body"> -->
        <div class="container">
          <div class="logopos whiteborder">
            <img class="ymsjlogo" src="../../assets/ymsjlogo.png">
          </div>
          <div class="textpos whiteborder">
            <span class="subtitletext">超人气卡牌游戏来袭，快来收集属于你的隐秘卡牌吧！</span>
          </div>
          <div class="buttonpos goldbuttonback">
            <a class="buttontext">立即领取</a>
          </div>
        </div>
      <!-- </div> -->
    </section>
  </div>
</template>

<style scoped>
.backpic{
  background-image: url("../../assets/title_slices/bgi1.png");
  background-size: cover;
  background-position: center;
}
@media (max-width: 1920px){
  .backpic{
    background-size: auto 100%;
  }
}
.whiteborder{
  text-shadow:5px 2px 6px #000000;
  color: #ffffff
}
.ymsjlogo{
  width: 472px;
  height: 200px;
}
.subtitletext{
  font-size: 36px;
}
.goldbuttonback{
  background-size: 100% 100%;
  background-image: url("../../assets/title_slices/button1.png");
  width: 268px;
  height: 60px;
  padding-top: 16px;
  margin: 0 auto;
  margin-top: 40px;
}
.buttontext{
  color: #773f05;
  font-size: 20px;
  font-weight: bold;
}
.logopos{
  margin-top: 236px;
}
.textpos{
  margin-top: 24px;
}
.buttonpos{
  margin-top: 48px;
}
.allheight{
  height: 840px;
}
</style>
