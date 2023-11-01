#!/bin/bash
sudo apt update
sudo apt install nginx -y
sudo service start nginx
sudo echo "Hi, this is terraform class">/var/www/html/index.html
