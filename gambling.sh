#!/bin/bash   

echo "Welcome To Gambling Simulator"

#Declaring constants
STAKE=100;
BET=1;
MAX_DAYS=28;


<<<<<<< HEAD
totalPerDay=0
winTemp=0
loseTemp=0
winDay=0
loseDay=0
winTotal=0
loseTotal=0
month=1

#Unlucky condition
unluckyCheck(){
	if [[ $loseTemp -lt $newStake ]]
	then
		loseTemp=$(($newStake))
		loseDay=$(($day))
	fi
}

#Lucky condition
luckyCheck(){
	if [[ $winTemp -lt $newStake ]]
	then
		winTemp=$(($newStake))
		winDay=$(($day))
	fi
=======
totalPerDay=$((STAKE));
finalAmt=0;
stakeAmt=0;


stakePercent(){
    STAKE_PERCENTAGE=$(( ($STAKE / 100 ) * 50 ))
    MAX_WIN=$(( $STAKE + $STAKE_PERCENTAGE ));
    MAX_LOSE=$(( $STAKE - $STAKE_PERCENTAGE  ));
>>>>>>> UC5_daysWonOrLost
}

#Daily amount
dailyCalculation(){
<<<<<<< HEAD
	while [[ $totalPerDay -lt $maxWin && $totalPerDay -gt $maxLose ]]
	do
        	if [[ $(($RANDOM%2)) -eq 1 ]]
        	then
            		totalPerDay=$(($totalPerDay - $BET))
        	else
            		totalPerDay=$(($totalPerDay + $BET))
        	fi
    	done
    	if [[ $totalPerDay -gt $newStake ]]
    	then
        	if [[ $(( $totalPerDay - $newStake )) -eq 1 ]]
        	then
			unluckyCheck
            		loseTotal=$(( $loseTotal + $newStake))
            		echo "At the End of day $day: $totalPerDay Lost $newStake"
        	else
			luckyCheck
            		winTotal=$(( $winTotal + $newStake ))
            		echo "At the End of day $day: $totalPerDay won $newStake"
        	fi
    	else
		unluckyCheck
        	loseTotal=$(( $loseTotal + $newStake))
        	echo "At the End of day $day: $totalPerDay Lost $newStake"
    	fi
=======
    while [[ $totalPerDay -lt $MAX_WIN && $totalPerDay -gt $MAX_LOSE ]]
    do
        result=$(($RANDOM % 2))
        if [[ $result -eq 1 ]]
        then
            (( totalPerDay++ ))
        else
            (( totalPerDay-- ))
        fi
    done
>>>>>>> UC5_daysWonOrLost
}

totalAmount(){
<<<<<<< HEAD
<<<<<<< HEAD
	totalPerDay=$(( $totalPerDay + $STAKE ))
    	newStake=$(( $totalPerDay / 2 ))
    	maxWin=$(( $totalPerDay + $newStake ))
    	maxLose=$(( $totalPerDay - $newStake ))
=======
	totalPerDay=$(( $totalPerDay+$STAKE ))
    	newStake=$(( $STAKE / 2 ))
    	maxWin=$(( $STAKE + $newStake ))
    	maxLose=$(( $STAKE - $newStake ))
>>>>>>> UC7_stopPlaying
	dailyCalculation
=======
    for (( day=1; day<=$MAX_DAYS; day++ ))
    do
    #newStake=$(( $stakeAmt + $STAkE))
    stakePercent
    dailyCalculation
    wonOrLost $day
    dailyAmount[$day]=$(( $totalPerDay ))
    done
>>>>>>> UC5_daysWonOrLost
}

play(){
	for (( day=1; day<=MAX_DAYS; day++ ))
	do
		totalAmount
	done
}

<<<<<<< HEAD
print(){
	echo "Your unluckiest day is $loseDay, You lost $loseTemp"
     	echo "Your luckiest day is $winDay, You won $winTemp"
=======
#total amount won or lost on a particular day
wonOrLost(){
    if [[ $STAKE -lt $totalPerDay ]]
    then
        echo "Start: $STAKE You won on Day"$1 $(( $totalPerDay - $STAKE )) "End: $totalPerDay"
    else
        echo "Start: $STAKE You lost on Day"$1 $(( $STAKE - $totalPerDay )) "End: $totalPerDay"
    fi
>>>>>>> UC5_daysWonOrLost
}
gameContinuation(){
        echo "For month $month"
        play
	print
	(( month++ ))
        if [ $winTotal -lt $loseTotal ]
        then
        	echo "Stop playing!"
	else
		read -p 'Enter 1 to continue playing OR Enter any other number to stop playing : ' num
		if [ $num -eq 1 ]
		then
			gameContinuation
		else
			echo "Bye"
		fi
	fi

}
gameContinuation
