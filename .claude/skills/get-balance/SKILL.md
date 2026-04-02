---
name: get-balance
description: |-
    Get cryptocurrency amount from specified addresses. Show the current amount when you are asked 
    'Show/Get balance' with a symbol of cryptocurrenty and at least one address.
---

Use this when you get an amount of cryptocurrency for specified addresses, choose an appropreate script 
from `./scripts/` directory and run it to get the balance of the addresses.

**Scripts**

|Cryptocurrency|Script Name|Description|
|---|---|---|
|Bitcoin|get_btc_utxo.sh|Fetches all the amount from addresses and sum them up.|
|Ethereum|get_eth_balance.sh||
|Ethereum ERC-20 Token|get_erc20_balance.sh|Fetches ERC-20 token balance on Ethereum|

When you fetch balance from Ethereum, you should also check ERC-20 token balances. Here is the table of ERC-20 token's contract addresses.

**Ethereum Contract Addresses**

When you fetch balance from Ethereum, you should also check ERC-20 token balances. Here is the table of ERC-20 token's contract addresses.

|Name|Symbol|Contract Address|
|---|---|---|
|USDC|USDC|0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48|
|Tether USD|USDT|0xdAC17F958D2ee523a2206206994597C13D831ec7|
|INTMAX|ITX|0xe24e207c6156241cAfb41D025B3b5F0677114C81|
