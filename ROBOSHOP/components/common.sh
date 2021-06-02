HEAD() {
  echo -n -e "\e[1m $1 \e[0m \t\t...\e[0m"
}

STAT() {
  if[ $1 -eq 0]; then
    echo -e "\e[1;32m done\e[0m"
  else
    echo -e "\e[1;31m Failed\e[0m"
  fi
}

FAIL() {
  echo -e "\e[1;31mFailed\e[0m"
}

SUCC() {
echo -e "\e[1;32mdone\e[0m"

}