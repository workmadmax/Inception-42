#!/bin/bash

# Start MariaDB

service mysql start && \
mysql -u root -e "CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE}; \
CREATE USER IF NOT EXISTS ${SQL_USER}@'localhost' IDENTIFIED BY '${SQL_PASSWORD}'; \
GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO ${SQL_USER}@'%' IDENTIFIED BY '${SQL_PASSWORD}'; \
ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}'; \
FLUSH PRIVILEGES;" && \
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

echo "=========== variables ==========="
echo "SQL_DATABASE = ${SQL_DATABASE}";
echo "SQL_USER = ${SQL_USER}";
echo "SQL_PASSWORD = ${SQL_PASSWORD}";
echo "SQL_ROOT_PASSWORD = ${SQL_ROOT_PASSWORD}";
echo "=========== variables ==========="
