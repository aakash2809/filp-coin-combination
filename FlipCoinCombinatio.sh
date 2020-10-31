#!/bin/bash -x

echo "                       Welcome to fliping coin combination problem                   "
echo "--------------------------------------------------------------------------------------"

result=$((RANDOM%2));
if [ $result -eq 0 ]
then
      echo "Heads"
  else
      echo "Tails"
fi
