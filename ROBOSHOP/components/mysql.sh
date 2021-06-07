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

HEAD "Restart MySQL "
systemctl enable mysqld && systemctl start mysqld
STAT $?

DEF_PASS=$(grep 'A temporary password' /var/log/mysqld.log | awk {'print$NF'})

echo "ALTER USER 'root'@'localhost' IDENTIFIED BY 'password';
uninstall plugin validate_password;" >/tmp/db.sql

HEAD "Reset MYSQL passwd"
mysql -uroot -p"${DEF_PASS}" </tmp/db.sql &>>/tmp/roboshop.log
STAT $?








