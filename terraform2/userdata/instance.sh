#!/bin/bash

apt-get update

## Change port ## 
perl -pi -e 's/^#?Port 22$/Port 6522/' /etc/ssh/sshd_config
service sshd restart || service ssh restart

## Install apache ##
apt install apache2 unzip -y
systemctl enable apache2

## Install AWS CLI ##
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install

## Download webpage ##
aws s3 cp s3://kien-bucket/index.html /var/www/html/index.html
#mv ./index.html /var/www/html/index.html


## Start apache and enable on startup ##
systemctl restart apache
systemctl enable apache