HEAD() {
  echo -n -e "\e[1m $1 \e[0m \t\t...\e[0m"
}

STAT() {
  if [ $1 -eq 0 ]; then
    echo -e "\e[1;32m done\e[0m"
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