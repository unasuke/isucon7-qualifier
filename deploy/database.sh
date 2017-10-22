#!/bin/bash
set -e
cd /home/isucon/isucon7-qualifier
git fetch origin $1
git checkout origin/$1
sudo systemctl restart mysql.service
