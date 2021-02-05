<template>
	<div class="box-card">
    <div class="cardhead">
      <img class="cardimg" src="../../assets/cards/01联会禁音使.png">
    </div>
    <div class="cardbody">
      <div class="cardname">这是卡牌名称</div>
      <!-- Main container -->
      <nav class="level owner">
        <!-- Left side -->
        <div class="level-left">
          <div class="level-item">
            <span class="searchicon">
              <img class="owneravatar" src="../../assets/title_slices/bgi1.png" />
            </span>
            <span class="ownername">
              Bebe Rexha
            </span>
          </div>
        </div>
        <!-- Right side -->
        <div class="level-right">
          <p class="level-item">
            <a class="button pricebutton" @click="$emit('ClickBuy')">
              <span class="icon">
                <img src="../../assets/sellcards_slices/编组.png">
              </span>
              <span class="price">
                3.238
              </span>
            </a>
          </p>
        </div>
      </nav>
    </div>
	</div>
</template>

<script>
export default {
	data(){
		return{

		}
  },
  props:['amount', 'type', 'finish', 'unfinish'],
	methods:{

  },
};
</script>


<style scoped>
.box-card{
  background-color: white;
  width: 326px;
  height: 310px;
}
.cardhead{
  border-bottom: solid #dbdbdb 1px;
}
.cardimg{
  margin: 12px auto;
  height: 183px;
  width: 128px;
  display: block;
}
.cardbody{
  padding: 16px;
  font-size: 14px;
}
.lefttext{
  width: 50%;
  text-align: left;
}
.righttext{
  width: 50%;
  text-align: right;
}
.cardname{
  font-size: 16px;
  font-weight: bold;
  text-align: left;
  color: #333333;
}
.owner{
  margin-top: 8px;
}
.owneravatar{
  width: 32px;
  height: 32px;
  border-radius: 50%;
}
.ownername{
  margin-left: 4px;
  color: #888888;
}
.pricebutton{
  background-color: #E7CE8A;
}
.price{
  color: #815004;
  margin-top: 1px;
}
</style>

