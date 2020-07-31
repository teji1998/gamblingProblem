#!/bin/bash

echo "Welcome to Gambling Simulator"

#initializing the constants
STAKE=100;
BET=1;
MAX_WIN=150;
MAX_LOSE=50;

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

