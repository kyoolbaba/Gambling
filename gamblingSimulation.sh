#!binbash
STAKE=100
BET=1
while [[ $STAKE -lt '150' &&  $STAKE -gt '50' ]]; do
if [[ $((RANDOM%2)) -eq '0' ]]
then
	STAKE=$((STAKE-BET))
else
	STAKE=$((STAKE+BET))
fi
done
