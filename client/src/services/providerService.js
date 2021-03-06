// Import Contracts and Utils
import AmsterdamContractABI from '../../build/contracts/Amsterdam.json'
import getWeb3 from '../utils/getWeb3'

var web3;
var amsterdamContractInstance;

var instantiateContract = (web3Result) => {
  return new Promise(function(resolve, reject) {
    // do a thing, possibly async, then…
    const contract = require('truffle-contract')
    const amsterdamContract = contract(AmsterdamContractABI)
    amsterdamContract.setProvider(web3Result.currentProvider)
    amsterdamContract.deployed().then((instance) => {
      amsterdamContractInstance = instance;
      resolve();
    }, (err) => {
      console.log(err); // Error: "It broke"
    });
  });
}

var getWeb3Service = () => {
  return new Promise(function(resolve, reject) {
    getWeb3
    .then(results => {
      web3 = results.web3
      // Instantiate contract once web3 provided.
      instantiateContract(results.web3).then(() => {
        resolve();
      }, (err) => {
        console.log("Error in instantiateContract");
        console.log(err);
      });
    })
    .catch((err) => {
      console.log('Error finding web3.')
      reject(Error(err));
    });
  });
} 

var getAmsterdamContractInstance = () => {
  return amsterdamContractInstance;
}

var getWeb3Object = () => {
  return web3;
}

var getCurrentAccount = () => {
  return new Promise(function(resolve, reject) {
    // do a thing, possibly async, then…
    web3.eth.getAccounts((error, accounts) => {
       resolve(accounts[0]);
    }, (err) => {
      console.log(err); // Error: "It broke"
    });
  });
}

export {
  getWeb3Service,
  getWeb3Object,
  getAmsterdamContractInstance,
  getCurrentAccount
}