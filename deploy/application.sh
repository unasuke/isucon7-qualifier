#!/bin/bash
git fetch origin $1
git checkout origin/$1
sudo systemctl restart isubata.ruby.service
sudo systemctl restart nginx.service
