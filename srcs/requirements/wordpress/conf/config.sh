#!/bin/bash

sleep 10

if [ -f ./wp-config.php ]; then
    echo "wp-config.php already exists"
else
    cd /var/www/wordpress || exit
    wget http://wordpress.org/latest.tar.gz
    tar xfz latest.tar.gz
    cp -R wordpress/* .
    rm -rf latest.tar.gz wordpress/
    sed -i -r "s/insert_db/$SQL_DATABASE/1" /tmp/wp-config.php
    sed -i -r "s/insert_user/$SQL_USER/1" /tmp/wp-config.php
    sed -i -r "s/insert_password/$SQL_PASSWORD/1" /tmp/wp-config.php
    mv /tmp/wp-config.php .
    rm -rf ./wp-config-sample.php
    chown -R www-data:www-data /var/www/wordpress
    wp core install --allow-root \
                    --url="$WP_URL" \
                    --title="$WP_TITLE" \
                    --admin_user="$WP_ADMIN" \
                    --admin_password="$WP_ADMIN_PASSWORD" \
                    --admin_email="$WP_ADMIN_EMAIL" \
                    --path='/var/www/wordpress'
    wp user create --allow-root \
                   "$WP_USER" \
                   "$WP_USER_EMAIL" \
                   --role=author \
                   --user_pass="$WP_USER_PASSWORD" \
                   --path='/var/www/wordpress'
fi

# Start PHP-FPM
/usr/sbin/php-fpm7.3 -F