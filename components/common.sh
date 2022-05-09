checkRootUser() {
  USER_ID=$(id -u)
if ["USER_ID" -ne o]; then
  echo -e "\e[31myou are suppose to run this as a sudo or root user\e[om"
  exit 1
  fi
}