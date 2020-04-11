#!binbash
STAKE=100
BET=1
if [[ $((RANDOM%2)) -eq '0' ]]
then
	STAKE=$((STAKE-BET))
else
	STAKE=$((STAKE+BET))
fi
