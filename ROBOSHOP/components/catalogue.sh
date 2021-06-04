#!/bin/bash

source components/common.sh
rm -f /tmp/roboshop.log

HEAD "Installing Catalogue"
yum install nodejs make gcc-c++ -y &>>/tmp/roboshop.log
STAT $?

HEAD "Add roboshop  and add User"
id roboshop &>>/tmp/roboshop.log
if [ $? -eq 0 ]; then
  echo "User is there ,continue the program" &>>/tmp/roboshop.log
else
  useradd roboshop &>>/tmp/roboshop.log
fi
STAT $?

HEAD "Download from Github"
curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip" &>>/tmp/roboshop.log
STAT $?

HEAD "Extract the files "
cd /home/roboshop && unzip /tmp/catalogue.zip &>>/tmp/roboshop.log && mv catalogue-main catalogue
STAT $?

HEAD "NPM install (node dependency)"
cd /home/roboshop/catalogue
npm install --unsafe-perm &>>/tmp/roboshop.log
STAT $?







echo installing catalogue
