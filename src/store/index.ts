// @ts-nocheck
import Vue from 'vue'
import Vuex from 'vuex'
import state from './state'
import getWeb3 from '../util/getWeb3'
import cardapi from '../util/getCards'

Vue.use(Vuex)

export const store = new Vuex.Store({
  state,
  mutations: {
    updateInjected (state, payload) {
      console.log(payload.isConnected())
      state.web3.isInjected = payload.isConnected()
    },
    registerWeb3Instance (state, payload) {
      console.log('registerWeb3instance Mutation being executed', payload)
      const result = payload
      state.web3.coinbase = result.coinbase
      state.web3.networkId = result.networkId
      state.web3.balance = parseInt(result.balance, 10)
      state.web3.web3Instance = result.web3
    },
    saveCards (state, input) {
      state.cards = input
      state.cardNotGot = false
    },
    newDrawCards (state, input) {
      state.drawCards.push(input)
    },
    async checkCards (state) {
      console.log('checking...')
      console.log('drawCards:')
      console.log(state.drawCards)
      const newCardAllList = await cardapi.getNewCards(state)
      console.log('getNewCards:')
      console.log(newCardAllList)
      const newCardList = []
      if (newCardAllList.length >= state.drawCards[0]) {
        for (let i = 0; i < state.drawCards[0]; i++) {
          newCardList.push(newCardAllList[i])
        }
        state.newCards.push(newCardList)
        const nextCardList = cardapi.addCard(state.cards, newCardList)
        console.log('nextCardList:')
        console.log(nextCardList)
        state.cards = nextCardList
        state.drawCards.shift()
      }
      if (state.drawCards.length == 0 && state.searchCardTimer) {
        console.log(state.newCards)
        clearInterval(state.searchCardTimer)
        console.log('beforetimer')
        console.log(state.searchCardTimer)
        state.searchCardTimer = null
        console.log('after')
        console.log(state.searchCardTimer)
      }
    }
  },
  actions: {
    registerWeb3 ({ commit }) {
      console.log('registerWeb3 Action being executed')
      getWeb3.then(async (result) => {
        console.log(result)
        console.log('committing result to registerWeb3Instance mutation')
        commit('registerWeb3Instance', result)
        setInterval(() => commit('updateInjected', result.web3()), 500)
        if (result.coinbase) {
          result.web3Instance = result.web3
          const usercards = await cardapi.getCards(result)
          console.log(usercards)
          commit('saveCards', usercards)
        }
      }).catch(e => {
        console.log('error in action registerWeb3', e)
      })
    },
    drawCards ({ commit }, input) {
      console.log('seted drawCards ' + input)
      if (state.drawCards.length == 0) {
        state.searchCardTimer = setInterval(() => {
          commit('checkCards')
        }, 2000)
      }
      commit('newDrawCards', input)
    }
  }
})
