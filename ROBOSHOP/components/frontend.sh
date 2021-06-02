#!/bin/bash

echo -e "\e[1;32m Installing frontend\e[0m"
rm -f /tmp/roboshop.log

yum install nginx -y &>>/tmp/roboshop.log