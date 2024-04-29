#!bin/bash

# execute script si wp-config n'existe pas

if [ ! -f "${WP_PATH}/wp-config.php" ]; then

	# install wordpress
	wp core download --path=$WP_PATH --allow-root
	echo "core downloaded" >&2
	sleep 10
	# configure wordpress with env variables
	wp config create --allow-root \
		--dbname=$SQL_DATABASE \
		--dbuser=$SQL_USER \
		--dbpass=$SQL_PASSWORD \
		--dbhost=mariadb:3306 \
		--path=$WP_PATH
	echo "wp-config.php created"
	# # configure wordpress to use SMTP for sending emails
	# wp config set --allow-root \
	#	--type=constant \
	#	--raw \
	#	WP_MAIL_HOST smtp.example.com
	# wp config set --allow-root \
	#	--type=constant \
	#	--raw \
	#	WP_MAIL_PORT 587
	# wp config set --allow-root \
	#	--type=constant \
	#	--raw \
	#	WP_MAIL_USERNAME your_smtp_username
	# wp config set --allow-root \
	#	--type=constant \
	#	--raw \
	#	WP_MAIL_PASSWORD your_smtp_password
	# wp config set --allow-root \
	#	--type=constant \
	#	--raw \
	#	WP_MAIL_SECURE tls
	echo "Setting up admin" >&2
	wp core install --allow-root \
		--url=$WP_URL \
		--title=$WP_TITLE \
		--admin_user=$WP_USER \
		--admin_password=$WP_PASSWORD \
		--admin_email=$WP_EMAIL \
		--path=$WP_PATH
	echo "Setting set up user" >&2
	wp user create --allow-root \
		$WP_USER2 $WP_USER_EMAIL \
		--role=editor \
		--user_pass=$WP_PASSWORD2 \
		--path=$WP_PATH
fi

# start php-fpm
mkdir -p /run/php
php-fpm7.4 -F

echo "Inception Launching" >&2