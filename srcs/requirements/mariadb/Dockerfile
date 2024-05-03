FROM debian:buster

RUN apt update -y
RUN apt install -y mariadb-server

COPY conf/mysqld.cnf /etc/mysql/mariadb.conf.d/mysqld.cnf

COPY conf/setup.sh /tmp/setup.sh
RUN chmod +x /tmp/setup.sh

EXPOSE 3306

CMD [ "/tmp/setup.sh" ]