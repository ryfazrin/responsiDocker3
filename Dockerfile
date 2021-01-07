FROM ubuntu:16.04

RUN apt update && \
    apt install nginx php7.0-fpm php7.0-mysql mariadb-server -y

RUN rm /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default && \
    mkdir /var/www/html/mywebsite/

COPY nginx.conf /etc/nginx/nginx.conf

COPY default /etc/nginx/sites-available/default

COPY index.php /var/www/html/mywebsite/index.php

COPY dbku.sql /var/dbku.sql

COPY script.sh /var/run/script.sh
RUN chmod 777 /var/run/script.sh

RUN ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default && \
    chown -R www-data:www-data /var/www/html/mywebsite 

EXPOSE 80 3306

CMD ./var/run/script.sh
