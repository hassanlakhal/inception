FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && apt-get install -y mariadb-server

COPY ./confg/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

