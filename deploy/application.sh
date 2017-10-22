#!/bin/bash
set -e
cd /home/isucon/isucon7-qualifier
git fetch origin $1
git checkout origin/$1
cd /home/isucon/isucon7-qualifier/webapp/ruby
./setup.sh
sudo systemctl restart isubata.ruby.service
sudo systemctl restart nginx.service
