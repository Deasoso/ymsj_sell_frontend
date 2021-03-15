<template>
  <div>
    <section class="hero is-cover allheight backpic" style="overflow:hidden;">
      <!-- <div class="hero-body"> -->
        <div class="container toleft">
          <div class="titlepos whiteborder">
            <div class="titletext">众多超高价值卡牌，等你来收藏 !</div>
          </div>
          <div class="subtitlepos whiteborder">
            <div class="subtitletext">随着卡池的不断丰富，每一张旧卡被抽到的概率会越来越低，甚至永久退出卡池，以此保障卡牌价值。</div>
          </div>
          <div class="textbackpos">
            <div class="intext">
              《隐秘世界OL》中，抽取的卡牌和道具都是同步上链的。玩家可以在游戏中通过交易行功能进行非绑定卡牌和道具的拍卖、收购，也可以进行自由交易，保障了玩家资产的保值。如果玩家想脱坑了，随时可以卖掉全部的卡牌，变成虚拟货币。
            </div>
          </div>
          <div class="goldbuttonback" @click="$router.push('/Shop')">
            <a class="buttontext">立即前往</a>
          </div>
        </div>
      <!-- </div> -->
    </section>
  </div>
</template>

<style scoped>
.backpic{
  background-image: url("http://ymsjimg.deaso40.com/title_slices/bgi4.png");
  background-size: cover;
  background-position: right;
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
.ymsjlogo{
  width: 472px;
  height: 200px;
}
.goldbuttonback{
  background-size: 100% 100%;
  background-image: url("http://ymsjimg.deaso40.com/title_slices/button1.png");
  width: 178px;
  height: 40px;
  padding-top: 8px;
  margin-top: -22px;
  margin-left: 600px;
  text-align: center;
  cursor: pointer;
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
  margin-left: 120px;
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
