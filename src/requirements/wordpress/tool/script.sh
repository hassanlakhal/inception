#!/bin/bash

if [ -e "/var/www/html/wordpress/wp-config-sample.php" ]; then
    echo " wordpress is exists."
else
    wget https://wordpress.org/latest.tar.gz > /dev/null 2>&1

    tar -xvf latest.tar.gz > /dev/null 2>&1

    mv wordpress/* /var/www/html/wordpress/

    rm -rf latest.tar.gz

    chown -R www-data:www-data /var/www/html/wordpress/*

    chmod -R 755 /var/www/html/wordpress/*

    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar > /dev/null 2>&1

    chmod +x wp-cli.phar 

    mv wp-cli.phar /usr/local/bin/wp

    cd  /var/www/html/wordpress
    echo "wating ...."
    sleep 10

    sed -i "s/database_name_here/$DB_NAME/g"  wp-config-sample.php

    sed -i "s/username_here/$DB_USER/g"  wp-config-sample.php

    sed -i "s/password_here/$DB_PASS/g"  wp-config-sample.php

    sed -i "s/localhost/mariadb:3306/g"  wp-config-sample.php

    cp wp-config-sample.php wp-config.php

    wp core install --allow-root \
        --url=https://$DOMAIN_NAME\
        --title=inception --admin_user=dirgham \
        --admin_password=$ADMIN_WD_PASS \
        --admin_email=info@example.com
    wp user create --allow-root \
        ghadanfar dirgham@example.com \
        --role=editor --user_pass=$USER_WD_PASS \
        --first_name=hassan \
        --last_name=lakhal 
    wp theme install modestra  --allow-root --activate

    echo "wordpress is created ."
fi

exec php-fpm7.4  -F




