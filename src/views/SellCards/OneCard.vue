<template>
	<div class="box-card">
    <div class="cardhead">
      <img class="cardimg" :src="drawablecards[cardData.id].url">
    </div>
    <div class="cardbody">
      <div class="cardname">
        {{drawablecards[cardData.id].name}}
        <span>
          x{{cardData.amount}}
        </span>
      </div>
      <!-- Main container -->
      <nav class="level owner">
        <!-- Left side -->
        <div class="level-left">
          <div class="level-item">
            <span class="searchicon">
              <img class="owneravatar" :src="randomavatars[parseInt(cardData.owner) % randomavatars.length].url" />
            </span>
            <span class="ownername">
              {{cardData.owner}}
            </span>
          </div>
        </div>
        <!-- Right side -->
        <div class="level-right">
          <p class="level-item">
            <a class="button pricebutton" @click="$emit('ClickBuy')">
              <span class="icon">
                <img src="http://ymsjimg.deaso40.com/sellcards_slices/编组.png">
              </span>
              <span class="price">
                {{getPrice(cardData.price)}}
              </span>
            </a>
          </p>
        </div>
      </nav>
    </div>
	</div>
</template>

<script>
import drawablecards from '@/util/constants/drawablecards'
import randomavatars from '@/util/constants/randomavatars'

export default {
  data () {
    return {
      drawablecards: drawablecards,
      randomavatars: randomavatars
    }
  },
  props: ['cardData'],
  methods: {
    getPrice (input) {
      if (input < 1e15) return '< 0.001'
      if (input > 1e21) return '> 1000.000'
      return (input / 1e18).toFixed(3)
    }
  }
}
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
  text-overflow: ellipsis;
  overflow: hidden;
  max-width: 120px;
  margin-left: 8px;
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
