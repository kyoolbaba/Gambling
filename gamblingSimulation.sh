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
#Method to find Luckiest day or Unluckiest day
calculateLuckyOrUnlucky(){
	declare -a arr1=$@
	for i in ${arr1[@]}; do
		(($i > max1 || max1 == 0 )) && max1=$i
		(($i < min1 || min1 == 0 )) && min1=$i
	done
    more=$max1
	day=1
	for i in ${arr1[@]}; do
		if [[ $i -eq $more ]]; then
			if [[ $win -eq '0' ]]; then
				LUCKIESTDAY=$day
				win=$((win + 1))
				break
			elif [[ $win -eq '1' ]]; then 
       	 		UNLUCKIESDAY=$day
				break
			fi
		fi
		((day++))
	done
}
calculateAmountWinOrLose(){
for (( i = 1 ; i<= $NO_OF_DAYS ;i++ )); do
	if [[ ${wins[i]} -gt ${loses[i]} ]]; then
		NO_OF_WINS=$((NO_OF_WINS +1))
	else
		NO_OF_LOSES=$((NO_OF_LOSES +1))
	fi
done

calculateLuckyOrUnlucky "${wins[@]}"

calculateLuckyOrUnlucky "${loses[@]}" 

if [[ $NO_OF_WINS -gt $NO_OF_LOSES ]];then
	amountOfDaysLost=$(( NO_OF_DAYS - NO_OF_WINS ))
	amountWon=$(((NO_OF_WINS - amountOfDaysLost)*50))
else
	amountLost=$((NO_OF_LOSES * 50))
	amountOfDaysWon=$(( NO_OF_DAYS - NO_OF_LOSES ))
	amountLost=$(((NO_OF_LOSES - amountOfDaysLost) * 50))
fi
}

for (( i = 1;i <= $NO_OF_DAYS ; i++  )); do
	STAKE=100
	WIN=0
	LOSE=0
	calculateWinOrLose 
done

calculateAmountWinOrLose



