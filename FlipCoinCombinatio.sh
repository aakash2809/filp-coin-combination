#!/bin/bash

#VARIABLES
maximum=0
temp=0
 
echo "          Wellcome flip coin combination problem           "
echo "------------------------------------------------------------"

#DECLARAtION OF  A DICTIONARY
declare -A flipStore

#FUNCTION TO FIND HEAD AND TAIL COMBINATION
totalFlip()
{
	for((i=0; i<$1; i++))
	do
		face=""
		for((j=0; j<$2; j++))
		do
			#GENERATE RANDOM NUMBER
			flipCoin=$((RANDOM%2))
			if [ $flipCoin -eq 0 ]
			then
				face+=H
			else
				face+=T
			fi
		done
		flipStore[$face]=$((${flipStore[$face]}+1))
	done
	echo "Count of all combination     :${flipStore[@]}"
}


#FUNCTION TO FIND PERCENTAGE AND ALSO FIND MAXIMUM HEAD OR TAIL WINNING COMBINANTION
totalPercentageFlip()
{
	for count in ${!flipStore[@]}
	do
		flipStore[$count]=$(( ${flipStore[$count]} *100 / $times ))
		temp=${flipStore[$count]}
		if [ $temp -gt $maximum ]
		then
			maximum=$temp
			key=$count
		fi
	done
}

#CHECKING HEADS OR TAILS
read -p "Enter number of times you want to flip:" times
echo   "Enter choice "
echo   "1)Singlet"
echo   "2)Doublet"
echo   "3)Triplet and so on:"
read  coins

totalFlip $times $coins
totalPercentageFlip

echo "All head and tail combination:${!flipStore[@]}"
echo "percentage of all combination:${flipStore[@]}"

sort=( $( printf "%s\n" "${flipStore[@]}" | sort -n ) )
echo "sorted order" ${sort[@]}

echo "Max winning combination      :" $maximum "-" $key

