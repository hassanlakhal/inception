#!/bin/bash

openssl req -x509 -nodes -keyout $KEY_S -out $CRT_S \
    -subj "/C=MA/ST=bengrir/L=bengrir/O=1337/OU=1337 Unit/CN=hlakhal-.42.fr"

cd /etc/nginx/sites-enabled/
sed -i "s#crtPath#$CRT_S#g" default
sed -i "s#keyPath#$KEY_S#g" default
sleep 10
exec nginx -g "daemon off;"