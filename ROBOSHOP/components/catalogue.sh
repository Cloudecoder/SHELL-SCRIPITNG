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
  STAT $?
else
  useradd roboshop &>>/tmp/roboshop.log
  STAT $?
fi


HEAD "Download from Github"
curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip" &>>/tmp/roboshop.log
STAT $?

HEAD "Extract the files "
cd /home/roboshop  && rm -rf catalogue && unzip /tmp/catalogue.zip &>>/tmp/roboshop.log && mv catalogue-main catalogue
STAT $?

HEAD "NPM install (node dependency)"
cd /home/roboshop/catalogue
npm install --unsafe-perm &>>/tmp/roboshop.log
STAT $?

HEAD "Fix Permission"
chmod roboshop:roboshop /home/roboshop -R
STAT $?

HEAD "Setup SystemD Service"
sed -i -e 's/MONGO_DNSNAME/mongodb.roboshop.internal/' /home/roboshop/catalogue/systemd.service && mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service
STAT $?

HEAD "STart Catalogue Service"
systemctl daemon-reload && systemctl enable catalogue &>>/tmp/roboshop.log && systemctl restart catalogue &>>/tmp/roboshop.log
STAT $?







