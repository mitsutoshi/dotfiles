# Get Solana Balance

args=("$@")
sum=0
for i in $(seq $#)
do
    address=${args[$i-1]}
    balance=`curl https://api.mainnet.solana.com \
      -s \
      -X POST \
      -H "Content-Type: application/json" \
      -d "
      {
        \"jsonrpc\": \"2.0\",
        \"id\": 1,
        \"method\": \"getBalance\",
        \"params\": [
          \"$address\",
          {
            \"commitment\": \"finalized\"
          }
        ]
      }
      " | jq .result.value`

      # echo "$address $balance"
      sum=$(( $sum + $balance ))
done
echo $sum | awk '{sum += $1} END {print sum / 1000000000 " SOL"}'
