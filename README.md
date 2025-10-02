# Lottery Smart Contract

A simple Ethereum-based lottery smart contract written in Solidity. Participants can enter by sending 1 ETH, and a winner is picked randomly by the manager once at least 3 participants have joined.

---

## Table of Contents

- [Overview](#overview)  
- [Features](#features)  
- [Smart Contract Functions](#smart-contract-functions)  
- [Deployment](#deployment)  
- [Usage](#usage)  
- [Disclaimer](#disclaimer)  

---

## Overview

`Lottery.sol` allows users to participate in a lottery by sending exactly 1 ETH. The manager (contract deployer) can pick a winner when there are at least 3 participants. The winner receives all ETH in the contract, and the lottery resets for a new round.

---

## Features

- Participation by sending 1 ETH  
- Minimum 3 participants required to pick a winner  
- Random winner selection (pseudo-random)  
- Manager-controlled balance checks and winner selection  
- Resets automatically after picking a winner  

---

## Smart Contract Functions

| Function | Visibility | Description |
|----------|------------|-------------|
| `participate()` | public, payable | Join the lottery by sending exactly 1 ETH. |
| `getBalance()` | public view | Returns contract balance. Only the manager can call this. |
| `random()` | public view | Generates a pseudo-random number using block data and player count. |
| `pickWinner()` | public | Manager picks a winner if there are at least 3 participants. Winner gets all ETH. Resets player list. |

---

## Deployment

1. Open [Remix IDE](https://remix.ethereum.org/)  
2. Create a new file `Lottery.sol` and paste the contract code  
3. Compile using Solidity version `>=0.7 <0.9.0`  
4. Deploy the contract to a testnet (e.g., Goerli) using MetaMask  

---

## Usage

1. Connect MetaMask to the deployed contract  
2. Call `participate()` with **1 ETH** to enter the lottery  
3. Only the manager can call `pickWinner()` after at least 3 participants have joined  
4. Winner receives the total ETH balance  
5. Contract resets automatically for the next round  

---

## Notes

- The `random()` function is **not secure** for production and can be manipulated. For real use, consider integrating Chainlink VRF.  
- Error message in `participate()` says `"please pay 1 ehter only"` → should be `"ether"`.  

---

## Disclaimer

This smart contract is for educational purposes. Test thoroughly on testnets before deploying on the mainnet. Use at your own risk.
