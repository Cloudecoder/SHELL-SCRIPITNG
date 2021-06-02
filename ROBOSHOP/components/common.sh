HEAD() {
  echo -n -e "\e[1m $1 \e[0m \t\t...\e[0m"
}

FAIL() {
  echo -e "\e[1;31mFailed\e[0m"
}

SUCC() {
echo -e "\e[1;32mdone\e[0m"

}