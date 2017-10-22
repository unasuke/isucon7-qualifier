#!/bin/bash

# $1 -> deployment branch
branch=$1
app_server_1='27.133.154.88'
app_server_2='163.43.31.223'
db_server='153.125.224.140'

# $1 -> server IP addr
deploy_application() {
  echo ssh -i deploy_id_rsa isucon@$1 "\"cd /home/isucon/isucon7-qualifier; ./deploy/application.sh $2\""
}

# $1 -> server IP addr
deploy_database() {
  echo ssh -i deploy_id_rsa isucon@$1 "\"cd /home/isucon/isucon7-qualifier; ./deploy/database.sh $2\""
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
