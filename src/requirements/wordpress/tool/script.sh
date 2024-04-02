#!/bin/bash

mkdir /var/www/html/wordpress

wget https://wordpress.org/latest.tar.gz

tar -xvf latest.tar.gz

mv wordpress/* /var/www/html/wordpress/

rm -rf latest.tar.gz

chown -R www-data:www-data /var/www/html/wordpress/*

chmod -R 755 /var/www/html/wordpress/*

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar 

mv wp-cli.phar /usr/local/bin/wp

sleep 5

wp config create --allow-root --dbname=$DB_NAME --dbuser=$DB_USER \
    --dbpass=$DB_PASS --dbhost=mariadb:3306 --path='/var/www/html/wordpress'

exec php-fpm7.4  -F




