#!/bin/bash

number=$1

half=$((number / 2))

mult=1
for (( i=1; i<=half; i++ )); do
  mult=$((mult * i))
done

sum=0
if (( number % 2 == 0 )); then
  for (( i=half+1; i<=number; i++ )); do
    sum=$((sum + i))
  done
else
  for (( i=half+2; i<=number; i++ )); do
    sum=$((sum + i))
  done
fi

echo "mult: $mult"
echo "sum: $sum"