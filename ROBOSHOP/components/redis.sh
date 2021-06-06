#!/bin/bash

source components/common.sh
rm -f /tmp/roboshop.log
set-hostame redis

HEAD "installing redis"
yum install epel-release yum-utils -y &>>/tmp/roboshop.log
yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y &>>/tmp/roboshop.log
yum-config-manager --enable remi &>>/tmp/roboshop.log
yum install redis -y &>>/tmp/roboshop.log
STAT $?

HEAD "Update BindIP"
sed -i -e 's/127.0.0.1/0.0.0.0' /etc/redis/redis.conf
STAT $?

HEAD "Restart Database"
systemctl enable redis &>>/tmp/roboshop.log && systemctl start redis &>>/tmp/roboshop.log
STAT $?

