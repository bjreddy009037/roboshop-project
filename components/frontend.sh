#!/usr/bin/env bash
source components/common.sh
checkRootUser
ECHO "installing nginx"
yum install nginx -y &>>${LOG_FILE}
statuschek $?

ECHO"downloading frontend code"
curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"&>>${LOG_FILE}
statuschek $?

cd /usr/share/nginx/html

ECHO "removing old files"
rm -rf * &>>${LOG_FILE}
statuschek $?

ECHO "extracting zip content"
unzip /tmp/frontend.zip &>>${LOG_FILE}
statuschek $?

ECHO "copying extracted files"
mv frontend-main/* . &>>${LOG_FILE} && mv static/* . &>>${LOG_FILE} && rm -rf frontend-main README.md &>>${LOG_FILE}
statuschek $?

ECHO "copy roboshop nignx config "
mv localhost.conf /etc/nginx/default.d/roboshop.conf &>>${LOG_FILE}
statuschek $?

ECHO "update nginx configuration"
systemctl enable nginx
systemctl start nginx
systemctl restart nginx
statuschek $?