#!/bin/bash

echo "Welcome To Gambling Simulator"

declare -A dailyAmount

STAKE=100;
BET=1;
MAX_DAYS=30;

totalPerDay=$((STAKE));
finalAmt=0;
stakeAmt=0;


stakePercent(){
    STAKE_PERCENTAGE=$(( ($STAKE / 100 ) * 50 ))
    MAX_WIN=$(( $STAKE + $STAKE_PERCENTAGE ));
    MAX_LOSE=$(( $STAKE - $STAKE_PERCENTAGE  ));
}

#Daily Amount
dailyCalculation(){
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
}

#Total Amount
totalAmount(){
    for (( day=1; day<=$MAX_DAYS; day++ ))
    do
    #newStake=$(( $stakeAmt + $STAkE))
    stakePercent
    dailyCalculation
    wonOrLost $day
    dailyAmount[$day]=$(( $totalPerDay ))
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
    if [[ $STAKE -lt $totalPerDay ]]
    then
        echo "Start: $STAKE You won on Day"$1 $(( $totalPerDay - $STAKE )) "End: $totalPerDay"
    else
        echo "Start: $STAKE You lost on Day"$1 $(( $STAKE - $totalPerDay )) "End: $totalPerDay"
    fi
}
totalAmount
