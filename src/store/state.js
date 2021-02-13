let state = {
  web3: {
    isInjected: false,
    web3Instance: null,
    networkId: null,
    coinbase: null,
    balance: null,
    error: null
  },
  contractInstance: null,
  cards: [], // 格式:[{id:1,amount:1}]
  newCards: [], // 格式:[[{id:1,amount:1},{id:2,amount:1}],[{id:1,amount:1},{id:2,amount:1}]]
  drawCards: [], // 格式：[10,1,10,1,1]，数字是抽的数量
  searchCardTimer: null
}
export default state
