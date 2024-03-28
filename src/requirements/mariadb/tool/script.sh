#!/bin/bash
service mariadb start

sleep 2

mariadb << EOF
    create database $DB_NAME;
    create user '$MYSQL_USER'@'localhost' identified by '$MYSQL_PASSWORD';
    grant all privileges on $DB_NAME.* to '$MYSQL_USER'@'localhost';
    flush privileges;
EOF

service mariadb stop

exec mysqld_safe
