#!/bin/bash

source components/common.sh
rm -f /tmp/roboshop.log
set-hostame MySQL

HEAD "Setup Mysql Repo"
echo '[mysql57-community]
name=MySQL 5.7 Community Server
baseurl=http://repo.mysql.com/yum/mysql-5.7-community/el/7/$basearch/
enabled=1
gpgcheck=0' > /etc/yum.repos.d/mysql.repo
STAT $?

HEAD "Installing mYSQl"
yum remove mariadb-libs -y && yum install mysql-community-server -y &>>/tmp/roboshop.log
STAT $?

HEAD "Generate root password"
grep temp /var/log/mysqld.log






