#!/bin/bash


echo -e "\e[33m HElLO /n WELCOME TO THE WORLD OF SANDEEP \e[0m"

date=$(date +%F)

echo -e "so today date is ${date}"


read -p "ENTER THE USERNAME :" username

if["$username" == "root" ]; then
  echo -e "Hey the $username is a admin user"
else
  echo -e "you need to update the $username to root "
fi

read -p "Enter th file name: " filename

if[ -f "$filename"]; then
  echo -e "file exists"
else
  echo -e "file not found"
fi