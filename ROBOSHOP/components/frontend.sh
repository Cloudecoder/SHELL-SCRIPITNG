#!/bin/bash

source components/common.sh

HEAD "Installing Nginx"
yum install nginx -y &>>/tmp/roboshop.log
echo -e "\e[32mDone\e[0m"







