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

cd  /var/www/html/wordpress

sleep 10

sed -i "s/database_name_here/$DB_NAME/g"  wp-config-sample.php

sed -i "s/username_here/$DB_USER/g"  wp-config-sample.php

sed -i "s/password_here/$DB_PASS/g"  wp-config-sample.php

sed -i "s/localhost/mariadb:3306/g"  wp-config-sample.php

cp wp-config-sample.php wp-config.php

wp core install --allow-root \
    --url=localhost:5050\
    --title=test --admin_user=admin \
    --admin_password=123 \
    --admin_email=info@example.com
exec php-fpm7.4  -F




