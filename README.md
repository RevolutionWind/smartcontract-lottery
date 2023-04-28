# Raffle Smart Contract

This project contains a Raffle smart contract, which allows users to participate in a lottery-like game on the Ethereum blockchain. The raffle selects a random winner using Chainlink's Verifiable Random Function (VRF) and rewards the winner with the accumulated Ether in the contract.

## Features

- Users can enter the raffle by sending Ether to the smart contract.
- The raffle automatically starts and ends based on a predefined interval.
- The contract uses Chainlink VRF to pick a random winner in a secure and provably fair manner.
- The winner is rewarded with the Ether accumulated in the contract.
- Chainlink Keepers monitor and maintain the contract, ensuring that the raffle runs smoothly.

## Prerequisites

To run this project, you need:

- [Node.js](https://nodejs.org/en/download/) installed (version 14.x or higher).
- [npm](https://www.npmjs.com/get-npm) or [yarn](https://classic.yarnpkg.com/en/docs/install) package manager.
- [Hardhat](https://hardhat.org/getting-started/#overview) development environment installed.
- An Ethereum wallet with some testnet Ether and testnet Chainlink tokens for deployment and testing.

## Getting Started

1. Clone the repository

2. Install the dependencies:

```bash
npm install
# or
yarn
```

3. Create a `.env` file in the project root directory and add your Ethereum wallet private key and an Infura project ID for connecting to the Ethereum network:

```ini
PRIVATE_KEY=YOUR_PRIVATE_KEY
INFURA_PROJECT_ID=YOUR_INFURA_PROJECT_ID
```

4. Compile the smart contract:

```bash
npx hardhat compile
# or
yarn hardhat compile
```

5. Deploy the smart contract to a testnet (e.g., Ropsten):

```bash
npx hardhat run --network ropsten scripts/deploy.js
# or
yarn hardhat run --network ropsten scripts/deploy.js
```

6. Run the test suite:

```bash
npx hardhat test
# or
yarn hardhat test
```

## Usage

Users can interact with the deployed Raffle smart contract by calling the `enterRaffle()` function and sending the required entrance fee in Ether. The raffle will automatically start and end based on the predefined interval. Chainlink Keepers will maintain the contract and ensure that the raffle proceeds smoothly, while the Chainlink VRF will provide a secure and provably fair random winner selection process.
