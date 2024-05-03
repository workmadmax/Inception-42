FROM debian:buster

RUN apt update
RUN apt install -y nginx

RUN mkdir -p /etc/nginx/ssl
RUN apt install -y openssl
RUN openssl req -x509 -nodes \
	-out /etc/nginx/ssl/tls.crt \
	-keyout /etc/nginx/ssl/tls.key \
	-subj "/C=BR/ST=Distrito Federal/L=Brasília/O=42SP/CN=mdouglas.42.org.br/UID=mdouglas"


RUN mkdir -p /var/run/nginx
COPY ./conf/nginx.conf /etc/nginx/sites-available/default

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

RUN mkdir -p /run/nginx

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]

