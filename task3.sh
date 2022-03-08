#!/bin/bash
count=$(( (100 + $RANDOM%100) ))
for (( i=0; i < $count; i++ ))
do
	echo -n "$i;"
	if (( $i%3 == 0 )); then
		echo -n "Fizz"
	fi
	if (( $i%5 == 0 )); then
		echo -n "Buzz"
	fi
	echo ""
done
