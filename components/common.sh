checkRootUser() {
  USER_ID=$(id -u)
if ["USER_ID" -ne o]; then
  echo -e "\e[31myou are suppose to run this as a sudo or root user\e[om"
  exit 1
  fi
}

statusCheck() {
  if [ $1 -eq 0 ]; then
    echo -e "\e[32mSUCCESS\e[0m"
  else
    echo -e "\e[31mFAILURE\e[0m"
    echo "Check the error log in ${LOG_FILE}"
    exit 1
  fi
}

LOG_FILE=/tmp/roboshop.log
rm -f $LOG_FILE

ECHO() {
  echo -e "=========================== $1 ===========================\n" >>${LOG_FILE}
  echo "$1"
}