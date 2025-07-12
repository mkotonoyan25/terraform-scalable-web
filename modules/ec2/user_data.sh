#!/bin/bash
apt update -y
apt install nginx -y
systemctl enable nginx
systemctl start nginx
echo 'Hope you get this page instead of just an "ERROR 404"' > /var/www/html/index.html
