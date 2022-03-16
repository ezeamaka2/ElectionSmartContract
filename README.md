# Election Smart Contract Project

This project demonstrates the use of Hardhat to create a VOTING smart contract. 

The voting smart contract follows the system in Nigeria, where VOTERS has to bee registered before they can vote and also CANDIDATES has be registered. So, in the `contract` folder is the `Election.sol` smart contract.

## How To Get Started with This Project

- Clone the project to you desktop
- cd into the `ElectionSmartContract` folder and run `npm install` to install all the dependencies required
- Create a `.env`
- In the `.env` file, add `RINKEBY_RPC_KEY:"your api from alchemy"` `PRIVATE_KEY:"your metamask private key"` and `ETHERSCAN_KEY:"your etherscan key"`

### Note

- I used `alchemy api` you can either use alchemy or infura. Which ever one you like
- I also used my `metamask private key`. So, you have to use yours to sign the transactions [Guide to show your metamask private key](https://metamask.zendesk.com/hc/en-us/articles/360015289632-How-to-Export-an-Account-Private-Key)
- I also used `Etherscan API` for the contract verification. When a contract is verified on etherscan, it has a green check mark that allows you to see and interact with the contract from etherscan
- You will need some test ether to be able to deploy contract. [Get Rinkeby, Ropston or Kovan Faucets from Chainlink](https://faucets.chain.link/rinkeby)

So, in the `.env` file, you need to replace the above `API KEYS` with your's.

### To Deploy The Contract

The `deploy script` is in the `scripts` folder. Since am using `Rinkeby` (you can use any testnet of your choice). To deploy the smart contract run
`npx hardhat run scripts/deploy.js --network rinkeby` this will deploy the cntract to etherscan rinkeby testnet

### Interacting with the Contract from the CLI

To interact with the smart contact from the command line, I have defined some tasks in the `tasks` folder
- task to get the total number of registered candidate `get-totalCandidate`
- task to add a new candidate `add-candidate`
- task to register a new voter `register-voter`

### How to run the task

first, run `npx hardhat` you will see the three custom task that I have defined. Then

- for `get-totalCandidate` task, run `npx hardhat get-totalCandidate --contract contract_address_from_the_deploy_script`
- for `add-candidate` task, the function requires the `name party age` of the candidate. So, you need to pass those values. Run `npx hardhat add-candidate --contract contract_address_from_the_deploy_script --name candidateName --party candidateParty --age candidateAge`
- for `register-voter`, the function requires the voters address as a value. So, run `npx hardhat register-voter --contract contract_address_from_the_deploy_script --address votersAccountAddress`

### Finally
If you follow through the process and you find it difficult to get the smart contract up and running, simply `create a new issue` I am always whilling to assist.
