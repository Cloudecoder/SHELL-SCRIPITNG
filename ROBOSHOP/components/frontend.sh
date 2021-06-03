#!/bin/bash

source components/common.sh
rm -f /tmp/roboshop.log

HEAD "Installing Nginx"
yum install nginx -y &>>/tmp/roboshop.log
STAT $?

HEAD "Starting Nginx"
systemctl start nginx &>>/tmp/roboshop.log
systemctl enable nginx &>>/tmp/roboshop.log
STAT $?

HEAD "Download from git"
curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip" &>>/tmp/roboshop.log
STAT $?

HEAD "delete old htdocs"
rm -rf /usr/share/nginx/html/*
STAT $?

HEAD "unzip file\t"
unzip -d /usr/share/nginx/html /tmp/frontend.zip &>>/tmp/roboshop.log
cd /usr/share/nginx/html
mv frontend-main/* .
mv static/* .
rm -rf frontend-master
STAT $?


#
# mv localhost.conf /etc/nginx/default.d/roboshop.conf






