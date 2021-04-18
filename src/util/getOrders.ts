import nft_abi from "@/contracts/NFT_abi.json"
import Vue from '../main.js'
import Web3 from 'web3'

const getOrders = async function(start, end, only_sold, only_no_sold, seller, buyer, seller_or_buyer, cardId){
  var web3js = window.web3;
  var web3;
  if(web3js){
    web3 = new Web3(web3js.currentProvider);
  }else{
    web3 = new Web3(new Web3.providers.HttpProvider('https://rinkeby.infura.io/v3/fa0ba0ec5edc4bc3b2c4cc7fa0c3050d'));
  }
  const contract_in = web3.eth.contract(nft_abi);
  const contract = contract_in.at(Vue.prototype.Global.contract_address);
  const getcoin = await new Promise(
    (resolve, reject) => {
      contract.get_order_batch(
        start,
        end,
        only_sold,
        only_no_sold,
        seller,
        buyer,
        seller_or_buyer,
        cardId,
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
  const baselength = getcoin[1].length;
  for(var j=0;j<getcoin[1].length;j++){
    if (parseInt(getcoin[1][j]) == 0) continue; // 如果seller为0则不计入
    userorders.push({
      orderid: getcoin[0][j].toNumber(),
      id: getcoin[0][j + baselength].toNumber() - 1,  // tip Deaso: 链上的卡牌是drawablecards索引+1
      amount: getcoin[0][j + baselength*2].toNumber(),
      price: getcoin[0][j + baselength*3].toNumber(),
      owner: getcoin[1][j]
    })
  }
  console.log(userorders);
  return userorders;
}

const getTransactions = async function(orderlist){
  var web3js = window.web3;
  var web3;
  if(web3js){
    web3 = new Web3(web3js.currentProvider);
  }else{
    web3 = new Web3(new Web3.providers.HttpProvider('https://rinkeby.infura.io/v3/fa0ba0ec5edc4bc3b2c4cc7fa0c3050d'));
  }
  const contract_in = web3.eth.contract(nft_abi);
  const contract = contract_in.at(Vue.prototype.Global.contract_address);
  console.log('getting...');
  var userorders = [];
  for(var i=0;i<orderlist.length;i++){
    console.log('getting' + i);
    const getcoin = await new Promise(
      (resolve, reject) => {
        contract.get_order_by_id(
          orderlist[i].orderid,
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
    userorders.push({
      orderid: orderlist[i].orderid,
      seller: getcoin[0],
      id: getcoin[1].toNumber() - 1,
      amount: getcoin[2].toNumber(),
      price: getcoin[3].toNumber(),
      buyer: getcoin[4],
      sold: getcoin[5]
    });
  }
  return userorders;
}

export default {
  getOrders,
  getTransactions
};