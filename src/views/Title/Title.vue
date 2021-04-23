<template>
  <div class="hello">
    <section class="hero is-cover allheight backpic">
      <!-- <div class="hero-body"> -->
        <div class="container">
          <div class="logopos whiteborder">
            <img class="ymsjlogo" src="http://ymsjimg.deaso40.com/ymsjlogo.png">
          </div>
          <div class="textpos whiteborder">
            <span class="subtitletext">{{$t('超人气卡牌游戏来袭，快来收集属于你的隐秘卡牌吧！')}}</span>
          </div>
          <div class="buttonpos" @click="$router.push('/Shop')">
            <a><img class="goldbutton" src="http://ymsjimg.deaso40.com/title_slices/button1.png"></a>
            <a><div class="buttontext">{{$t('立即领取')}}</div></a>
          </div>
        </div>
      <!-- </div> -->
    </section>
    <title2 style="z-index: 1;position:relative;" />
    <title3 />
    <title4 style="z-index: 1;position:relative;" />
    <title5 />
    <title6 />
  </div>
</template>

<script>
import Title2 from './Title2'
import Title3 from './Title3'
import Title4 from './Title4'
import Title5 from './Title5'
import Title6 from './Title6'

export default {
  components: {
    Title2,
    Title3,
    Title4,
    Title5,
    Title6
  }
}
</script>

<style scoped>
.backpic{
  margin-top: 80px;
  background-image: url("http://ymsjimg.deaso40.com/title_slices/bgi1.png");
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
  color: #ffffff;
}
.ymsjlogo{
  width: 472px;
  height: 200px;
}
.subtitletext{
  font-size: 36px;
}
.buttonpos{
  margin: 0 auto;
  width: 268px;
  margin-top: 48px;
}
.goldbutton{
  width: 268px;
  height: 60px;
}
.buttontext{
  color: #773f05;
  font-size: 20px;
  font-weight: bold;
  margin-top: -52px;
}
.logopos{
  margin-top: 236px;
}
.textpos{
  margin-top: 24px;
}
.allheight{
  height: 840px;
}
</style>
