HEAD() {
  echo -n -e "\e[1m $1 \e[0m \t\t...\e[0m"
}

STAT() {
  if [ $1 -eq 0 ]; then
    echo -e "\e[1;32m Done\e[0m"
  else
    echo -e "\e[1;31m Failed\e[0m"
    echo -e "\e[1;33m CHECK THE LOG FILR FOR MORE DETAILS: /tmp/roboshop.log \e[0m"
    exit 1
  fi
}

FAIL() {
  echo -e "\e[1;31mFailed\e[0m"
}

SUCC() {
echo -e "\e[1;32mdone\e[0m"

}

USER_ADD() {
  HEAD "Add roboshop  and add User"
  id roboshop &>>/tmp/roboshop.log
  if [ $? -eq 0 ]; then
    echo "User is there ,continue the program" &>>/tmp/roboshop.log
    STAT $?
  else
    useradd roboshop &>>/tmp/roboshop.log
    STAT $?
  fi

 }

NODE_JS() {
  HEAD "Installing NOdejs"
yum install nodejs make gcc-c++ -y &>>/tmp/roboshop.log
STAT $?

USER_ADD

HEAD "Download from Github"
curl -s -L -o /tmp/$1.zip "https://github.com/roboshop-devops-project/$1/archive/main.zip" &>>/tmp/roboshop.log
STAT $?

HEAD "Extract the files "
cd /home/roboshop  && rm -rf $1 && unzip /tmp/$1.zip &>>/tmp/roboshop.log && mv $1-main $1
STAT $?

HEAD "NPM install (node dependency)"
cd /home/roboshop/$1
npm install --unsafe-perm &>>/tmp/roboshop.log
STAT $?

HEAD "Fix Permission"
chmod roboshop:roboshop /home/roboshop -R
STAT $?

HEAD "Setup SystemD Service"
sed -i -e 's/MONGO_DNSNAME/mongodb.roboshop.internal/' /home/roboshop/$1/systemd.service && mv /home/roboshop/$1/systemd.service /etc/systemd/system/$1.service
STAT $?

HEAD "STart Catalogue Service"
systemctl daemon-reload && systemctl enable $1 &>>/tmp/roboshop.log && systemctl restart $1 &>>/tmp/roboshop.log
STAT $?

}
