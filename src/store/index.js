import Vue from 'vue'
import Vuex from 'vuex'
import state from './state'
import getWeb3 from '../util/getWeb3'
import cardapi from '../util/getCards'

Vue.use(Vuex)

export const store = new Vuex.Store({
  state,
  mutations: {
    registerWeb3Instance (state, payload) {
      console.log('registerWeb3instance Mutation being executed', payload)
      let result = payload
      let web3Copy = state.web3
      web3Copy.coinbase = result.coinbase
      web3Copy.networkId = result.networkId
      web3Copy.balance = parseInt(result.balance, 10)
      web3Copy.isInjected = result.injectedWeb3
      web3Copy.web3Instance = result.web3
      state.web3 = web3Copy
    },
    saveCards (state, input) {
      state.cards = input;
      state.cardNotGot = false;
    },
    newDrawCards (state, input){
      state.drawCards.push(input);
    },
    async checkCards (state) {
      console.log('checking...');
      console.log('drawCards:');
      console.log(state.drawCards);
      const newCardAllList = await cardapi.getNewCards(state);
      console.log('getNewCards:');
      console.log(newCardAllList);
      var newCardList = []
      if(newCardAllList.length >= state.drawCards[0]){
        for(var i=0;i<state.drawCards[0];i++){
          newCardList.push(newCardAllList[i])
        }
        state.newCards.push(newCardList);
        const nextCardList = cardapi.addCard(state.cards, newCardList);
        console.log('nextCardList:');
        console.log(nextCardList);
        state.cards = nextCardList;
        state.drawCards.shift();
      }
      if(state.drawCards.length == 0 && state.searchCardTimer){
        console.log(state.newCards);
        clearInterval(state.searchCardTimer);
        console.log('beforetimer');
        console.log(state.searchCardTimer);
        state.searchCardTimer = null;
        console.log('after');
        console.log(state.searchCardTimer);
      }
    }
  },
  actions: {
    registerWeb3 ({commit}) {
      console.log('registerWeb3 Action being executed')
      getWeb3.then(async (result) => {
        console.log('committing result to registerWeb3Instance mutation')
        commit('registerWeb3Instance', result)
        if (result.coinbase){
          result.web3Instance = result.web3
          const usercards = await cardapi.getCards(result);
          console.log(usercards);
          commit('saveCards', usercards)
        }
      }).catch(e => {
        console.log('error in action registerWeb3', e)
      })
    },
    drawCards ({commit}, input) {
      console.log('seted drawCards ' + input);
      if(state.drawCards.length == 0){
        state.searchCardTimer = setInterval(() => {
          commit('checkCards')
        }, 2000)
      }
      commit('newDrawCards', input)
    },
  }
})
