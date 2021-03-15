<template>
  <div>
    <section class="is-cover allheight backpic" style="overflow:hidden;">
      <!-- <div class="hero-body"> -->
        <div class="container">
          <h1 class="ypos1 whiteborder">
            <img class="nextlogo" src="http://ymsjimg.deaso40.com/title_slices/element1.png">
          </h1>
          <h2 class="ypos2 whiteborder">
            <span class="subtitletext">即刻开始你的卡牌收藏之旅</span>
          </h2>
          <h2 class="ypos3 whiteborder">
            <span class="normaltext">《隐秘世界Online》改编自热门原创桌游《隐秘世界》，是一款基于区块链的集换式卡牌对战游戏。</span>
          </h2>
        </div>
        <div class="ypos4">
          <div class="card1 cardback">
            <img class="cardlogo" src="http://ymsjimg.deaso40.com/title_slices/battle.png">
            <div class="cardtitle">
              战斗
            </div>
            <div class="cardtext">
              在对战中，玩家可以切换到远景模式，查看三个地区的总体情况，做出战略性的布局。
            </div>
          </div>
          <div class="card2 cardback">
            <img class="cardlogo" src="http://ymsjimg.deaso40.com/title_slices/cards.png">
            <div class="cardtitle">
              收藏
            </div>
            <div class="cardtext">
              少量发放的卡牌，可能只有十几张、几张甚至唯一一张，具有极高的收藏价值。
            </div>
          </div>
          <div class="card3 cardback">
            <img class="cardlogo" src="http://ymsjimg.deaso40.com/title_slices/coin.png">
            <div class="cardtitle">
              交易
            </div>
            <div class="cardtext">
              玩家可以将链上的资产转移到交易行上进行寄售，也可以拍下别人寄售的资产。
            </div>
          </div>
          <div class="card4 cardback">
            <img class="cardlogo" src="http://ymsjimg.deaso40.com/title_slices/crown.png">
            <div class="cardtitle">
              愿景
            </div>
            <div class="cardtext">
              除了核心的对战玩法外，好友互动、卡组分析、背景图鉴等功能也会持续更新上线，形成一个完整的隐秘世界。
            </div>
          </div>
        </div>
        <img class="ypos5" src="http://ymsjimg.deaso40.com/title_slices/element2.png">
      <!-- </div> -->
    </section>
  </div>
</template>

<style scoped>
.backpic{
  background-image: url("http://ymsjimg.deaso40.com/title_slices/bgi2.png");
  background-size: cover;
  background-position: center;
}
@media (max-width: 1920px){
  .backpic{
    background-size: auto 100%;
  }
}
.whiteborder{
  text-shadow:5px 2px 6px #ffffff;
  color: #333333;
}
.nextlogo{
  width: 314px;
  height: 72px;
}
.allheight{
  height: 840px;
}
.ypos1{
  margin-top: 48px;
}
.subtitletext{
  font-size: 36px;
  font-weight: bold;
}
.ypos2{
  margin-top: 36px;
}
.normaltext{
  font-size: 14px;
  color: #333333;
  font-weight: bold;
}
.ypos3{
  margin-top: 2px;
}
.cardback{
  background-size: 100% 100%;
  background-image: url("http://ymsjimg.deaso40.com/title_slices/cardback.png");
  width: 266px;
  height: 384px;
}
.ypos4{
  margin-top:48px;
}
.card1{
  margin-left: calc(50vw - 604px);
}
.card2{
  margin-top: -384px;
  margin-left: calc(50vw - 290px);
}
.card3{
  margin-top: -384px;
  margin-left: calc(50vw + 24px);
}
.card4{
  margin-top: -384px;
  margin-left: calc(50vw + 338px);
}
.cardlogo{
  width: 83px;
  height: 80px;
  margin-top: 80px;
}
.cardtitle{
  font-size: 36px;
  font-weight: bold;
  color: #ffffff;
}
.cardtext{
  font-size: 14px;
  color: #ffffff;
  max-width: 174px;
  margin: 0 auto;
}
.ypos5{
  margin-top: 132px;
}
</style>