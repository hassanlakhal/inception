FROM debian:bullseye

RUN mkdir /run/php

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y php7.4 php-fpm php-mysql wget curl


COPY ./tool/script.sh /script.sh

RUN chmod u+x script.sh

RUN echo "listen = 127.0.0.1:9000" >> /etc/php/7.4/fpm/php-fpm.conf

CMD [ "./script.sh"]