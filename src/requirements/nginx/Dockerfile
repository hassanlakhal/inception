FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && apt-get install nginx -y

COPY ./conf/default.conf /etc/nginx/sites-enabled/default

EXPOSE 80

# RUN service nginx start 
CMD [ "nginx","-g","daemon off;"]