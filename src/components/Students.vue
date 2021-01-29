<template>
  <div>
    <div class="cardcontainer">
      <div class="columns is-gapless">
        <div class="column fullheight">
          <div class="vermiddle">
            <img class="avatar" src="@/assets/touxiang2.jpg"/>
            <h1 class="title whiteborder">
              司令死灵法师
            </h1>
            <h2 class="subtitle whiteborder">
              建站小记 2020.8.20
            </h2>
          </div>
        </div>
        <div class="column fullheight">
          <div class="vermiddle">
            <div class="whiteback">
              <h2 class="subtitle blackfont">
                大家好，我是司令死灵法师。<br>
                从挺久以前就想建个个人网站，现在终于有一些时间了。<br>
                大概会收集以前的个人作品。<br>
                然后分享一些个人的想法什么的。<br>
                如果有话想说，可以去留言板留言。<br>
                总之祝大家玩的开心啦。<br>
                <br>
                -> 个人介绍<br>
                -> 过往作品补档<br>
                -> 日志<br>
                -> 留言板<br>
              </h2>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<style scoped>
/*
  section 2
*/
.avatar{
  height: 132px;
  width: 132px;
  border-radius:50%;
  border: 3px solid white;
  vertical-align: top;
  display:inline-block;
  margin-bottom: 20px;
}
.cardcontainer{
  background-image: url("../assets/manread.jpg");
  background-size: 100vw auto;
}
.whiteborder{
  text-shadow:5px 2px 6px #000000;
  color: #ffffff
}
.fullheight{
  height: 100vh;
}
.vermiddle{
  position: relative;
  top: 50%;
  transform: translateY(-50%);
}
.whiteback{
  margin: 30px 30px;
  padding: 30px;
  height: calc(100vh - 120px);
  background-color: #ffffff99;
  text-align: left;
}
.blackfont{
  color: #000000;
}

</style>