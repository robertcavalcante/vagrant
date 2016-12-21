#!/bin/bash

#Update CentOS with any patches
yum update -y --exclude=kernel

#Tools
yum install -y nano git unzip screen

yum install -y httpd httpd-devel httpd-tools

chkconfig --add httpd
chkconfig httpd on

service httpd stop

rm -rf /var/www/html
ln -s /vagrant /var/www/html

apache httpd start

#PHP
yum install -y php php-cli php-common php-devel php-mysql

#MySql
yum install -y mysql mysql-server mysql-devel
chkconfig --add mysqld
chkconfig mysqld on

service mysqld start

mysql -u root -e "SHOW DATABASES";

#DOWNWLOAD Starter Content
cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/robertcavalcante/vagrant/master/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/robertcavalcante/vagrant/master/info.php
service httpd restart


