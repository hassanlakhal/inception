#!/bin/bash

mkdir /var/www/html/wordpress

workdir /var/www/html/wordpress

wget https://wordpress.org/latest.tar.gz

tar -xvf latest.tar.gz

# mv wordpress/* /var/www/html/wordpress/

rm -rf latest.tar.gz

chown -R www-data:www-data /var/www/html/wordpress/*

chmod -R 755 /var/www/html/wordpress/*

# tail -f
exec php-fpm7.4  -F
# php-fpm -RF



