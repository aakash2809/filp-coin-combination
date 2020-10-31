#!/bin/bash 

echo "            Wellcome fliping coin combination problem         "
echo "------------------------------------------------------------------"
#CONSTANT
HEAD=0
NUMBER_OF_COIN=3

#DECLARTION OF DICTIONARY
declare -A doubletFlip

#USER INPUT
read -p "Enter the Number of Flip : " numberOfFlip

# FUNCTION FOR TRIPLET
triplet()
{
   for(( count=0; count<$numberOfFlip; count++ ))
   do
      for(( countCoin=0; countCoin<$NUMBER_OF_COIN; countCoin++ ))
      do
         result=$(( RANDOM % 2 ))

         if [ $result -eq $HEAD ]
         then
           coinFace+=H
				
         else
            coinFace+=T
         fi
		done
		((doubletFlip[$coinFace]++))
		coinFace=""
	done
}

#TOTAL PERCENTAGE OF DOUBLET COMBINATION
totalDoubletPercentage()
{
   for index in ${!doubletFlip[@]}
   do
      doubletFlip[$index]=`echo "${doubletFlip[$index]}" $numberOfFlip | awk '{printf $1 * 100 / $2 }'`
   done
}

#FUNCTION CALL 
triplet
totalDoubletPercentage
echo "   " ${!doubletFlip[@]}
echo "   " ${doubletFlip[@]}

