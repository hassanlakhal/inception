FROM debian:bullseye

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y nginx openssl && \
    apt-get clean && \
    mkdir -p /var/www/html/wordpress /etc/nginx/ssl && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY ./conf/default.conf /etc/nginx/sites-enabled/default
COPY ./tool/script.sh /script.sh

RUN chmod u+x /script.sh

EXPOSE 80

# RUN service nginx start 
CMD ["./script.sh"]