FROM debian:buster

ARG SQL_DATABASE=x
ARG SQL_USER=x
ARG SQL_PASSWORD=x
ARG SQL_ROOT_PASSWORD=x

# Install MariaDB

RUN apt update -y
RUN apt upgrade -y
RUN apt install -y mariadb-server -y

# Copy the configuration file
COPY conf/mysqld.cnf /etc/mysql/mariadb.conf/mysqld.cnf

# Copy the script
COPY conf/create.sh /tmp/create.sh
# Run the script
RUN chmod +x /tmp/create.sh

# Expose the port
EXPOSE 3306

# Run the server
CMD [ "/tmp/create.sh" ]