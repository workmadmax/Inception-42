FROM debian:12.5

# Arguments
ARG SQL_DATABASE=x
ARG SQL_USER=x
ARG SQL_PASSWORD=x
ARG SQL_ROOT_PASSWORD=x

# Install MariaDB
RUN apt update -y
RUN apt upgrade -y
RUN apt install -y mariadb-server -y

# Copy the configuration file
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Copy the script
COPY conf/setup.sh /setup.sh

# Run the script
RUN chmod +x /setup.sh

# Expose the port
EXPOSE 3306

# Run the server
CMD ["/setup.sh"]