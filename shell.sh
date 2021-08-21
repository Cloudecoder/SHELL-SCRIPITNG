#!/bin/bash

number=5
multiply= `expr $number*$i`
for (( i = 0; i < 10; i++ )); do
    echo "$number x $i =" ${multiply}
done





