FROM debian:buster

# Install dependencies required for Wordpress
RUN apt update
RUN apt install -y wget\
                   php7.3\
                   php-fpm\
                   php-mysql

# Create Wordpress directory
RUN mkdir -p /var/www/wordpress
RUN chown -R root:root /var/www/wordpress

# Remove default and andd custom PHP-FPM config
RUN rm /etc/php/7.3/fpm/pool.d/www.conf
COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN mkdir /run/php

# Install WP-CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# Prepare configuration script execution on start
COPY conf/config.sh /tmp/config.sh
COPY conf/wp-config.php /tmp/wp-config.php
RUN chmod +x /tmp/config.sh
CMD [ "/tmp/config.sh" ]

# Expose PHP-FPM port
EXPOSE 9000