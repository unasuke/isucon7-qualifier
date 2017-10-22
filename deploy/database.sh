#!/bin/bash
set -e
git fetch origin $1
git checkout origin/$1
sudo systemctl restart mysql.service
