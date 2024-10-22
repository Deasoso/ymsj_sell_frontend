// @ts-nocheck
import nft_abi from '@/contracts/NFT_abi.json'
import drawablecards from '@/util/constants/drawablecards'
import Vue from '../main'

const getCards = async function (input) {
  const contract_in = input.web3Instance().eth.contract(nft_abi)
  const contract = contract_in.at(Vue.prototype.Global.contract_address)
  const accounts = []
  const cards = []
  for (let i = 0; i < drawablecards.length; i++) {
    accounts.push(input.coinbase)
    cards.push(drawablecards[i].arrid + 1) // tip Deaso: 链上的卡牌是drawablecards索引+1
  }
  const getcoin = await new Promise(
    (resolve, reject) => {
      contract.balanceOfBatch(
        accounts,
        cards,
        function (error, result) {
          if (!error) {
            resolve(result)
          } else {
            reject(error)
          }
        })
    }
  )
  const usercards = []
  for (let j = 0; j < drawablecards.length; j++) {
    if (getcoin[j].toNumber() != 0) {
      usercards.push({
        id: drawablecards[j].arrid,
        amount: getcoin[j].toNumber()
      })
    }
  }
  return usercards
}

const getNewCards = async function (state) {
  const web3 = state.web3
  const oldCards = state.cards
  const newCards = await getCards(web3)
  console.log('newCards:')
  console.log(newCards)
  console.log('oldCards:')
  console.log(oldCards)
  const compared = []
  for (let i = 0; i < newCards.length; i++) {
    let have = 0
    for (let j = 0; j < oldCards.length; j++) {
      if (newCards[i].id == oldCards[j].id) {
        have = oldCards[j].amount
      }
    }
    if (have < newCards[i].amount) {
      for (let k = 0; k < newCards[i].amount - have; k++) {
        // 需要一张张显示
        compared.push({
          id: newCards[i].id,
          amount: 1
        })
      }
    }
  }
  return compared
}

const addCard = function (oriCardList, addCardList) {
  for (let i = 0; i < addCardList.length; i++) {
    let have = false
    for (let j = 0; j < oriCardList.length; j++) {
      if (oriCardList[j].id == addCardList[i].id) {
        oriCardList[j].amount += addCardList[i].amount
        have = true
        break
      }
    }
    if (!have) {
      // 没有在之前的卡牌列表找到，新增。
      oriCardList.push({
        id: addCardList[i].id,
        amount: addCardList[i].amount
      })
    }
  }
  return oriCardList
}

export default {
  getCards,
  getNewCards,
  addCard
}
