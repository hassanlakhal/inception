FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && apt-get install nginx -y \
      && apt-get install openssl -y

RUN mkdir /var/www/html/wordpress

RUN mkdir -p /etc/nginx/ssl

COPY ./conf/default.conf /etc/nginx/sites-enabled/default

COPY ./tool/script.sh /script.sh

RUN chmod u+x /script.sh

EXPOSE 80

# RUN service nginx start 
CMD ["./script.sh"]