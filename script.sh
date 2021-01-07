#!/bin/bash
service mysql start

mysql -u root -e "use mysql; update user set plugin='' where User='root'; flush privileges;"
mysql -u root -e "create database dbku;"
mysql -u root dbku < /var/dbku.sql

service php7.0-fpm start && nginx

