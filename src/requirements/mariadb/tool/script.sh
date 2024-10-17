#!/bin/bash
service mariadb start

sleep 2

if ! mariadb -u"$DB_USER" -p"$DB_PASS" -e \
"SELECT 1 FROM mysql.user WHERE user='$DB_USER'" &> /dev/null; then
    mariadb -u"$DB_USER" -p"$DB_PASS" <<EOF
        CREATE DATABASE $DB_NAME;
        CREATE USER '$DB_USER'@'wordpress' IDENTIFIED BY '$DB_PASS';
        GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'wordpress';
        FLUSH PRIVILEGES;
EOF
else
    echo "Database $DB_NAME already exists."
fi


service mariadb stop

exec mysqld_safe
