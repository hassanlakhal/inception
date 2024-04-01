FROM debian:bullseye

RUN mkdir /run/php

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y php7.4-mysqli php-fpm php-mysql wget curl


COPY ./tool/script.sh /script.sh

RUN chmod u+x script.sh

COPY ./conf/def.conf /etc/php/7.4/fpm/pool.d/
#RUN echo "listen = 127.0.0.1:9000" > /etc/php/7.4/fpm/pool.d/www.conf

CMD ["./script.sh"]