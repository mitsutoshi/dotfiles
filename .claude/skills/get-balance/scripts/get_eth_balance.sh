# 0x48810631f4208d388ef6bbA5568e06fF466EC6CF
balance=`curl "https://eth.api.onfinality.io/public" \
  -s \
  -X POST \
  -H "content-type: application/json" \
  -d \
    "{ \"jsonrpc\": \"2.0\",
      \"method\": \"eth_getBalance\",
      \"params\": [
        \"$1\",
        \"latest\"
      ],
      \"id\": 1
    }" | jq .result | tr -d '\"'`
num=`printf "%d" $balance`
#echo $num | awk '{sum += $1} END {print sum / 1000000000000000000 " ETH"}'
echo "$1\t$num"
