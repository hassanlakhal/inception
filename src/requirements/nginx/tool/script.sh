#!/bin/bash

openssl req -x509 -nodes -keyout /etc/nginx/ssl/inception.key -out /etc/nginx/ssl/inception.crt \
    -subj "/C=MA/ST=bengrir/L=bengrir/O=1337/OU=1337 Unit/CN=hlakhal-"

sleep 10 
exec nginx -g "daemon off;"