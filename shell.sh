#!/bin/bash

number=5
for (( i = 1; i <= 10; i++ )); do
    echo "$number X $i= $((number*i))"
done

a=1
while [ $a -le 10  ]; do
    echo "$number X $a =$((number*a))"
    a=$((a+1))
done

