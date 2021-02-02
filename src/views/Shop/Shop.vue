<template>
  <div>
    <section class="is-cover allheight backpic">
      <nav class="level gemhead" style="margin-bottom: 4px;">
        <div class="level-left">
          <!-- 左边没有东西 -->
        </div>
        <div class="level-right">
          <p class="level-item mygem">
            我的宝石：10000
          </p>
        </div>
      </nav>
      <nav class="level buyhead" style="margin-bottom: 4px;">
        <div class="level-left">
          <!-- 左边没有东西 -->
        </div>
        <div class="level-right">
          <div class="buttonpos goldbuttonback">
            <a class="buttontext">立即领取</a>
          </div>
        </div>
      </nav>
    </section>
  </div>
</template>

<style scoped>
.backpic{
  margin-top: 80px;
  background-image: url("../../assets/title_slices/bgi1.png");
  background-size: auto 100%;
  background-position: center;
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
}
.goldbuttonback{
  background-size: 100% 100%;
  background-image: url("../../assets/title_slices/button1.png");
  width: 268px;
  height: 60px;
  padding-top: 16px;
  margin: 0 auto;
}
.buttontext{
  color: #773f05;
  font-size: 20px;
  font-weight: bold;
}
.buttonpos{
  margin-top: 48px;
}
</style>
