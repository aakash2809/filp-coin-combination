
#!/bin/bash -x

headCount=0
tailCount=0
HEAD=0
#TAIL=1
count=0
#DECLARETION OF DICTIONARY
declare -A singlet


echo "                       Welcome to fliping coin combination problem                   "
echo "--------------------------------------------------------------------------------------"
read -p "enter the no.of flips" numberOfFlips
# STORE HEAD COUNT AND TAIL COUNT IN DICTIONARY
for(( count=0 ; count<$numberOfFlips; count++ ))
do
   result=$(( RANDOM % 2 ))

   if [ $result -eq $HEAD ]
   then
      singlet[HEAD]=$((++headCount))
   else
      singlet[TAIL]=$((++tailCount))
   fi
done

#PERCENTAGE OF WININGS
singletHeadPercentage=`echo "${singlet[HEAD]}" $numberOfFlips | awk '{ printf $1 * 100 / $2 }'`
singletTailPercentage=`echo "${singlet[TAIL]}" $numberOfFlips | awk '{print $1 *100 / $2 }'`

echo "head count:" $headCount
echo "tail count:"$tailCount 
echo "single head percentage : " $singletHeadPercentage "%"
echo "single tail percentage : " $singletTailPercentage "%"

