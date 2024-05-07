FROM alpine:3.13

RUN	apk update && apk upgrade && apk add --no-cache \
	nginx \
	openssl

RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
	-out /etc/nginx/ssl/mdouglas.pem \
	-keyout /etc/nginx/ssl/mdouglas.key \
	-subj "/C=BR/ST=SP/L=idk/0=42 School/OU=mdouglas/CN=mdouglas/"

RUN mkdir -p /run/nginx
COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]