#!binbash
STAKE=100
BET=1
NO_OF_DAYS=20
calculateWinOrLose(){
while [[ $STAKE -lt '150' &&  $STAKE -gt '50' ]]; do
if [[ $((RANDOM%2)) -eq '0' ]]
then
	LOSE=$((LOSE +1))
	STAKE=$((STAKE-BET))
else
	WIN=$((WIN +1))
	STAKE=$((STAKE+BET))
fi
done
	wins[((WIN_COUNT++))]=$WIN 
	loses[((LOSE_COUNT++))]=$LOSE	
}

for (( i = 1;i <= $NO_OF_DAYS ; i++  )); do
	STAKE=100
	WIN=0
	LOSE=0
	calculateWinOrLose 
		
done


