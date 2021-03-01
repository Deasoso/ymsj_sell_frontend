<template>
  <div class="hello">
    <section class="is-cover allheight backpic">
      <div class="logopos1 whiteborder">
        <img class="ymsjlogo" src="../../assets/title_slices/element3.png">
      </div>
      <div class="logopos2 whiteborder">
        <img class="ymsjlogo" src="../../assets/title_slices/element3(1).png">
      </div>
      <div class="textpos whiteborder">
        <div class="subtitletext">「隐秘世界」</div>
        <div class="subtitletext">引领卡牌游戏新潮流</div>
      </div>
      <div class="buttonpos goldbuttonback" @click="$router.push('/Shop')">
        <a class="buttontext">立即游玩</a>
      </div>
    </section>
  </div>
</template>

<style scoped>
.backpic{
  background-image: url("../../assets/title_slices/bgi6.png");
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
  width: 230px;
  height: 34px;
}
.subtitletext{
  font-size: 36px;
}
.goldbuttonback{
  width: 240px;
  height: 60px;
  padding-top: 12px;
  margin: 0 auto;
  border-width: 5px;
  border-color: #E7CE8A;
  border-radius: 30px;
  border-style: outset;
  cursor: pointer;
}
.buttontext{
  color: #E7CE8A;
  font-size: 20px;
  font-weight: bold;
}
.logopos1{
  padding-top: 138px;
  margin-left: calc(50vw - 470px);
  text-align: left;
}
.logopos2{
  margin-top: -34px;
  margin-left: calc(50vw + 240px);
}
.textpos{
  margin-top: -76px;
  font-weight: bold;
}
.buttonpos{
  margin-top: 48px;
}
.allheight{
  height: 420px;
}
</style>
