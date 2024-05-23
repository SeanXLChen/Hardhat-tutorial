# Hardhat-tutorial
I try to learn how to use hardhat for smart contract mimic deployment

### Hardhat Project Structure
When you initialize a Hardhat project in your local environment, the structure includes the following important files/folders:

`/contracts`: All of your .sol files
`/scripts`: .js files for running scripts
`/artifacts`: artifacts produced out of the contract compilation
`/test:` .js files for using testing libraries
`hardhat.config.js`: file with project configurations (very important!!!!)
Important Hardhat Concepts
The `hardhat.config.js` file is the most important file in your project!

> ⚠️ If you have a bug/issue, this is first file to look at! 👀

Also, when you compile a contract, its artifacts (the ABI and bytecode) will be stored in a newly created /artifacts folder


### AU Suggested Hardhat Flow
Want to get up and running with a Hardhat project? 🏇 Just follow this flow:

1. Open a terminal
2. in your terminal run `npm init -y` to initialize a package.json
3. Run `npm i hardhat`
4. Run `npm i dotenv`
5. Run `touch .env` in order to create a `.env` file at the root-level of your project, then populate it with important data and save
6. Run `npx hardhat init` which will initialize a brand new Hardhat project
We recommend the following flow: Choose the current root > `YES` to the `.gitignore` > `YES` to install the sample project's dependencies
7. Add `require(‘dotenv’).config()` at the top of your `hardhat.config.js` file
8. Add `networks` flag to `hardhat.config.js`, add your Alchemy RPC URL under `url` and your testnet private key under `accounts`
9. Set up your scripts and contracts, then deploy in a flash! ⚡️

follow this [hardhat link](https://hardhat.org/hardhat-runner/docs/getting-started) to compile and test the sample contracts

Contract.sol deployed to sepolia testnet at [here](https://sepolia.etherscan.io/address/0xB5e7a76A88ee6DB9A637a2bFa580BC816a3B9c73)