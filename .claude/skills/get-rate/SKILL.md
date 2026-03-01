---
name: get-rate
description: Show a current exchange rate for specified currency. Use when you are asked "Show/Get the current rate/price ..." with two symbols like `usd/jpy`.
argument-hint: usd/jpy
---

Get a current exchange rate of $ARGUMENT[0]/$ARGUMENT[1]. And then, show the rate without any other words.
All we want to know is only the rate.

When you are asked showing an exchange rate with argument `USD/JPY`, you should show the value of JPY to 1 USD.
In an another example, when asked with argument `BTC/USD`, you need to show the value of USD to 1 BTC.

# Output format

Output only price information such as `$1,000`. Any other information such as explanation or source url are not needed.

# Souce

These web services serve trusted price infomation.

## Cryptocurrency

* [coingecko](https://www.coingecko.com/)
* [Tradingview](https://tradingview.com/)

## Fiat

* [Yahoo Finance](https://finance.yahoo.com/)
* [Tradingview](https://tradingview.com/)

