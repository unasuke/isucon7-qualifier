#!/bin/bash

# $1 -> deployment branch
branch=$1
app_server_1='27.133.154.88'
app_server_2='163.43.31.223'
db_server='153.125.224.140'

# $1 -> server IP addr
deploy_application() {
  ssh -i deploy_id_rsa isucon@$1
  git fetch origin $2
  git checkout origin/$2
  sudo systemctl restart isubata.ruby.service
  sudo systemctl restart nginx.service
}

# $1 -> server IP addr
deploy_database() {
  ssh -i deploy_id_rsa isucon@$1
  git fetch origin $2
  git checkout origin/$2
  sudo systemctl restart mysql.service
}

echo deploy branch $branch to application server $app_server_1 ...
deploy_application $app_server_1 $branch
echo done.

echo deploy branch $branch to application server $app_server_2 ...
deploy_application $app_server_2 $branch
echo done.

echo deploy branch $branch to database server $db_server ...
deploy_database $db_server $branch
echo done.
