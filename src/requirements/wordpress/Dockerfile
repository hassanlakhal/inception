FROM debian:bullseye

RUN mkdir /run/php && \
    apt-get update && apt-get upgrade -y && \
    apt-get install -y php7.4 php-fpm php-mysql wget curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY ./tool/script.sh /script.sh
COPY ./conf/def.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN chmod u+x script.sh


CMD ["./script.sh"]