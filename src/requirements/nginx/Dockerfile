FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && apt-get install nginx -y

EXPOSE 80

RUN service nginx start && cat