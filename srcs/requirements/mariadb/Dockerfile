FROM	debian:bullseye

# install package with minimal layers
RUN apt-get -y update && apt-get -y upgrade && apt-get -y install mariadb-server

COPY conf/my.conf /etc/mysql/my.cnf
COPY tools/script.sh /etc/mariadb/conf/script.sh

RUN chmod +x /etc/mariadb/conf/script.sh

EXPOSE 3306

ENTRYPOINT [ "sh", "/etc/mariadb/conf/script.sh" ]