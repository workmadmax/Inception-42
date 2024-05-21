FROM debian:bullseye

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install nginx && apt-get install -y openssl
RUN openssl req -x509 -newkey rsa:2048 -days 365 -nodes -out /etc/nginx/inception.crt -keyout /etc/nginx/inception.key -subj "/C=BR/ST=DF/L=Brasilia/O=Develop/CN=mdouglas"

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]