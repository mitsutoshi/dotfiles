# This script fetches ERC-20 token balance on Ethereum.
#
# [Arguments]
#   $1: Wallet address.
#   $2: Token contract address.

# 48810631f4208d388ef6bbA5568e06fF466EC6CF
# 0xe24e207c6156241cAfb41D025B3b5F0677114C81
wallet_address=$1
contract_address=$2
padding=000000000000000000000000

result=`curl "https://eth.api.onfinality.io/public" \
  -s \
  -X POST \
  -H "content-type: application/json" \
  -d \
  "{
    \"id\": 1,
    \"jsonrpc\": \"2.0\",
    \"method\": \"eth_call\",
    \"params\": [
      {
        \"data\": \"0x70a08231$padding$wallet_address\",
        \"to\": \"$contract_address\"
      },
      \"latest\"
    ]
  }" | jq -r .result`

echo "ibase=16; $(printf '%s' "${result#0x}" | tr '[:lower:]' '[:upper:]')" | bc
