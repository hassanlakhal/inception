#!/bin/bash
service mariadb start

sleep 2

mariadb << EOF
    create database $DB_NAME;
    create user '$DB_USER'@'%' identified by '$DB_PASS';
    grant all privileges on $DB_NAME.* to '$DB_USER'@'%';
    flush privileges;
EOF

service mariadb stop

exec mysqld_safe
