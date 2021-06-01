#!/bin/bash


## declare a function

echo -e "\e[32m CALCULATE YOUR DISTANCE BY DEFINING SPEED & TIME \e[0m"
read -p "ENTER THE SPEED : " speed
read -p "ENTER THE TIME : " time


distance() {
  echo -e "\e[33m YOUR DISTANCE IS CALCULATED SUCCESSFULLY \e[0m"

  distance=$((speed * time))
  echo -e "\e[35m Your distance = $distance \e[0m"

}

distance
distance "$1" "$2"