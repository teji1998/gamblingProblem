#!/bin/bash

echo "Welcome To Gambling Simulator"

declare -A dailyAmount

STAKE=100;
BET=1;
MAX_DAYS=30;

totalPerDay=$((STAKE));
finalAmt=0;
newStake=0;
stakeAmt=0;

newStakePercent(){
    stakePercentage=$(( $newStake / 2))
    maxWin=$(( newStake + stakePercentage ));
    maxLose=$(( newStake - stakePercentage ));
}

#Daily Amount
dailyCalculation(){
    while [[ $totalPerDay -lt $maxWin && $totalPerDay -gt $maxLose ]]
    do
        result=$(($RANDOM % 2))
        if [[ $result -eq 1 ]]
        then
            (( totalPerDay++ ))
        else
            (( totalPerDay-- ))
        fi
    done
}

#Total Amount
totalAmount(){
    for (( day=1; day<=$MAX_DAYS; day++ ))
    do
    newStake=$(( $stakeAmt + $STAKE))
    newStakePercent
    dailyCalculation
    wonOrLost $day
    dailyAmount[$day]=$(( $totalPerDay ))
    stakeAmt=$(( $totalPerDay ))
    done
}

printDailyAmt(){
    for (( day=1;day<=$MAX_DAYS;day++ ))
    do
        echo -e "Final Amount On Day" $day "\t" ${dailyAmount[$day]} "\n"
    done
}

#total amount won or lost on a particular day
wonOrLost(){
    if [[ $newStake -lt $totalPerDay ]]
    then
        echo "Start: $newStake You won on Day"$1 $(( $totalPerDay - $newStake )) "End: $totalPerDay"
    else
        echo "Start: $newStake You lost on Day"$1 $(( $newStake - $totalPerDay )) "End: $totalPerDay"
    fi
}
totalAmount
