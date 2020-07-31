#!/bin/bash

<<<<<<< HEAD
echo "Welcome to Gambling Simulator"

<<<<<<< HEAD
stake=100;
bet=1;
<<<<<<< HEAD
=======
=======
#initializing the constants
STAKE=100;
BET=1;
MAX_WIN=150;
MAX_LOSE=50;
>>>>>>> UC3_resignPoint

total=$(( STAKE ));

#Condition for winning or losing the bet
while [[ $total -le $MAX_WIN && $total -ge $MAXLOSE ]]
do
	result=$(( $RANDOM % 2 ))
	if [[ $result -eq 1 ]]
	then
		echo " You won 1 dollar "
		(( total++ ))
	else
		echo " You lost 1 dollar "
		(( total-- ))
	fi
done

<<<<<<< HEAD
if [[ $result -eq 1 ]]
then
	echo "You won 1 dollar"
	total=$(($stake+1))
else
	echo "You lost 1 dollar"
	total=$(($stake-1))
fi
>>>>>>> UC2_winOrLose
=======
>>>>>>> UC3_resignPoint
=======
echo "Welcome To Gambling Simulator"

declare -A dailyAmount

STAKE=100;
BET=1;
STAKE_PERCENTAGE=$(($(( STAKE / 100 )) * 50))
MAX_WIN=$((STAKE + STAKE_PERCENTAGE));
MAX_LOSE=$((STAKE - STAKE_PERCENTAGE));
MAX_DAYS=30;
TOTAL_BET_AMOUNT=$((STAKE * MAX_DAYS))

totalPerDay=$(( STAKE ));
finalAmount=0;

#Money Won or lost per day
dailyCalculation(){
	while [[ $totalPerDay -lt $MAX_WIN && $totalPerDay -gt $MAX_LOSE ]]
	do
		result=$(( $RANDOM % 2 ))
		if [[ $result -eq 1 ]]
		then
			(( totalPerDay++ ))
		else
			(( totalPerDay-- ))
		fi
	done
}

#Total money after gambling
totalAmount(){
	for (( day=1; day<=$MAX_DAYS; day++ ))
	do
		dailyCalculation
		dailyAmount[$day]=$(( totalPerDay ))
		finalAmount=$(( $finalAmount + $totalPerDay ))
		totalPerDay=$(( STAKE ))
	done
}

printDailyAmt(){
	for (( day=20;day<=$MAX_DAYS;day++ ))
	do
		echo -e "Final Amount On Day" $day "\t" ${dailyAmount[$day]} "\n"
	done
}

#Amount won or lost
winOrLose(){
	if [[ $finalAmount -gt $TOTAL_BET_AMOUNT ]]
	then
		echo " YOU WON $"$(( $finalAmount - $TOTAL_BET_AMOUNT ))
	else
		echo " YOU LOST $"$(($TOTAL_BET_AMOUNT-$finalAmount))
	fi
}

totalAmount
printDailyAmt
winOrLose
>>>>>>> UC4_daysTotalAmount
