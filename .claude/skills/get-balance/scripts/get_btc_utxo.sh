# Get Bitcoin UTXO
#
# [arguments]
#   Bitcoin addresses.
#
# [purpose]
#   This script fetches UTXO of Bitcoin from specified addresses and Show the total amount of them.


# Fetch all UTXO in the spcified address.
#
# Arguments:
#   $1: Bitcoin address.
#
# Return:
#   Total UTXO stored in the address.
#
function get_utxo() {
    utxo=`curl -s -X GET "https://mempool.space/api/address/$1/utxo" | jq '.[].value' | awk '{sum += $1} END {print sum}'`
    if [ $? -ne 0 ]; then
        echo "Failed to fetch UTXO in $address"
        return 1
    fi
    echo $utxo
}

args=("$@")
sum=0
for i in $(seq $#)
do
    utxo=`get_utxo ${args[$i-1]}`
    sum=$(( $sum + $utxo ))
    echo "${args[$i-1]}\t$utxo"
done
echo $sum | awk '{sum += $1} END {print sum / 100000000 " BTC"}'
