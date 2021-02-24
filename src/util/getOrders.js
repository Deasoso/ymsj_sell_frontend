import nft_abi from "@/contracts/NFT_abi.json"
import Vue from '../main.js'

const getOrders = async function(input, start, end){
  const contract_in = input.web3Instance().eth.contract(nft_abi);
  const contract = contract_in.at(Vue.prototype.Global.contract_address);
  const getcoin = await new Promise(
    (resolve, reject) => {
      contract.get_sell_list_batch(
        start,
        end,
        function(error, result){
        if(!error){
          resolve(result);
        }else{
          reject(error);
        }
      })
    }
  );
  console.log(getcoin);
  var userorders = [];
  for(var j=0;j<getcoin[0].length;j++){
    if (parseInt(getcoin[0][j]) == 0) continue;
    userorders.push({
      owner: getcoin[0][j],
      id: getcoin[1][j].toNumber() - 1,  // tip Deaso: 链上的卡牌是drawablecards索引+1
      amount: getcoin[2][j].toNumber(),
      price: getcoin[3][j].toNumber()
    })
  }
  return userorders;
}


export default {
  getOrders,
};