#!/bin/bash

echo "Welcome To Gambling Simulator"

declare -a lucky
declare -a unlucky

#Declaring Constants
STAKE=100;
BET=1;
MAX_DAYS=28;

totalPerDay=$((STAKE));
finalAmt=0;
newStake=0;
stakeAmt=0;
tempWin=0;
tempLost=0;
dayWin=0;
dayLose=0;

newStakePercent(){
        stakePercentage=$(($newStake/2))
        maxWin=$((newStake+stakePercentage));
        maxLose=$((newStake-stakePercentage));
}

#Daily amount
dailyCalculation(){
    while [[ $totalPerDay -lt $maxWin && $totalPerDay -gt $maxLose ]]
    do
        result=$(($RANDOM%2))
        if [[ $result -eq 1 ]]
        then
            ((totalPerDay++))
        else
            ((totalPerDay--))
        fi
    done
}

#Total Amount
totalAmount(){
    for (( day=1; day<=$MAX_DAYS; day++ ))
    do
        newStake=$(($stakeAmt + $STAKE))
        newStakePercent
        dailyCalculation
        wonOrLost $day
  		stakeAmt=$(($totalPerDay))
    done
}

#To find Luckiest or Unluckiest day
wonOrLost(){
    if [[ $newStake -lt $totalPerDay ]]
    then
        result=$(($totalPerDay - $newStake))
        echo "Start: $newStake You won on Day"$1 $result "End: $totalPerDay"
        if [[ $result -gt $tempWin ]]
        then
            tempWin=$(($result))
            dayWin=$(($1))
        fi
    else
        result2=$(($newStake - $totalPerDay))
        echo "Start: $newStake You lost on Day"$1 $result2 "End: $totalPerDay"
        if [[ $result2 -gt $tempLose ]]
        then
            tempLose=$(($result2))
            dayLose=$(($1))
        fi

    fi
}

totalAmount
echo -e "Luckiest Day " $dayWin "\nUnluckiest Day: " $dayLose