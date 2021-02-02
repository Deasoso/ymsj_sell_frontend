<template>
  <div>
    <section class="is-cover allheight backpic">
      <nav class="level gemhead" style="margin-bottom: 4px;">
        <div class="level-left">
          <!-- 左边没有东西 -->
        </div>
        <div class="level-right">
          <p class="level-item mygem whiteborder">
            我的宝石：10000
          </p>
        </div>
      </nav>
      <nav class="level buyhead" style="margin-bottom: 4px;">
        <div class="level-left">
          <!-- 左边没有东西 -->
        </div>
        <div class="level-right">
          <div class="goldbuttonback">
            <img class="gemicon" src="../../assets/shop_slices/宝石15.png">
            <a class="goldbuttontext">购买宝石</a>
          </div>
        </div>
      </nav>
      <div class="textback">
        <div class="titlepos whiteborder">
          <div class="titletext">卡牌召唤</div>
        </div>
        <div class="subtitlepos whiteborder">
          <img class="treasurebox" src="../../assets/shop_slices/treasurebox.png">
        </div>
        <div class="intextpos">
          <nav class="level buybuttons"><!-- 有level，按钮垂直居中 -->
            <div class="buybuttonback">
              <img class="buygemicon" src="../../assets/shop_slices/宝石15.png">
              <a class="buybuttonvalue">120</a>
              <a class="buybuttontext">单次召唤</a>
            </div>
            <div class="buybuttonback">
              <img class="buygemicon" src="../../assets/shop_slices/宝石15.png">
              <a class="buybuttonvalue">1000</a>
              <a class="buybuttontext">十连召唤</a>
            </div>
          </nav>
        </div>
      </div>
      <img class="fairy" src="../../assets/shop_slices/fair.png">
    </section>
  </div>
</template>

<style scoped>
.backpic{
  margin-top: 80px;
  background-image: url("../../assets/shop_slices/bgi8.png");
  background-size: auto 100%;
  background-position: right;
}
.whiteborder{
  text-shadow:5px 2px 6px #000000;
  color: #ffffff
}
.allheight{
  height: 1000px;
}
.gemhead{
  padding-top: 74px;
  margin: 0 auto;
  width: calc(100vw - 400px);
}
.buyhead{
  padding-top: 14px;
  margin: 0 auto;
  width: calc(100vw - 400px);
}
.mygem{
  color: #E4C46D;
  font-size: 20px;
}
.goldbuttonback{
  background-size: 100% 100%;
  background-image: url("../../assets/shop_slices/button2.png");
  width: 220px;
  height: 60px;
  padding-top: 16px;
  margin: 0 auto;
}
.goldbuttontext{
  color: #E4C46D;
  font-size: 20px;
  font-weight: bold;
  margin-left: 8px;
}
.gemicon{
  width: 30px;
  height: 30px;
}
.textback{
  margin-left: calc(920px - (1920px - 100vw));
  margin-top: 24px;
  width: 800px;
  height: 600px;
  background-color: #000000b3;
  border-style: outset;
  border-width: 8px;
  border-color: #E7C874;
  text-align: center;
}
.titlepos{
  margin-top: 48px;
}
.subtitlepos{
  margin-top: 42px;
}
.intextpos{
  margin-top: 64px;
}
.titletext{
  font-size: 48px;
  color: #E7C874;
}
.intext{
  color: #ffffff;
  font-size: 14px;
  padding-left: 24px;
  padding-right: 24px;
}
.treasurebox{
  width: 240px;
  height: 242px; 
}
.buybuttons{
  margin-left: 85px;
  margin-right: 85px;
}
.buybuttonback{
  margin-left: 109px;
  background-size: 100% 100%;
  background-image: url("../../assets/shop_slices/button1.png");
  width: 268px;
  height: 60px;
  padding-top: 16px;
  margin: 0 auto;
}
.buygemicon{
  width: 30px;
  height: 30px;
}
.buybuttonvalue{
  color: #773F05;
  font-size: 20px;
  font-weight: bold;
  margin-left: 4px;
  padding-top: 100px;
}
.buybuttontext{
  color: #773F05;
  font-size: 20px;
  font-weight: bold;
  margin-left: 36px;
}
.fairy{
  margin-left: calc(-790px - (1920px - 100vw));
  margin-top: -587px;
  overflow: hidden;
  height: 781px;
  width: 1125px;
  max-width: 1125px;
}
</style>
