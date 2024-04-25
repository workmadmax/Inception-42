#!/bin/bash


# Start MariaDB

service mariadb start

# wait time for db 9s
sleep 9

mysql -u root -e "CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE}; \
CREATE USER IF NOT EXISTS ${SQL_USER}@'localhost' IDENTIFIED BY '${SQL_PASSWORD}'; \
GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO ${SQL_USER}@'%' IDENTIFIED BY '${SQL_PASSWORD}'; \
ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}'; \
FLUSH PRIVILEGES;" && \
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown