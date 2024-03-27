#!/bin/bash
service mariadb start

sleep 2

service mariadb stop

mariadb << "EOF
    create database $DB_NAME;
    cretae user '$MYSQL_USER'@'localhost' identified by '$MYSQL_PASSWORD';
# EOF"

exec mysqld_safe
