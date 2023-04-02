#!/bin/bash

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
sleep 5
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
wp core download --path="/var/www/html" --allow-root
sleep 5
wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=$DB_HOST  --path="/var/www/html" --allow-root
wp core install --url=$DOMAIN_NAME/ --title=mfagri --admin_user=$DB_USER --admin_password=$DB_PASS --admin_email=mfagri@gmail.com --skip-email  --path="/var/www/html" --allow-root
wp user create maroun5 mfagri1@gmail.com --role=author --user_pass=1234  --path="/var/www/html" --allow-root
wp theme install astra --activate  --path="/var/www/html" --allow-root
#bonus redis
wp config set WP_CACHE_KEY_SALT 'localhost'  --path="/var/www/html" --allow-root
wp config set WP_REDIS_HOST 'redis'  --path="/var/www/html" --allow-root
wp config set WP_REDIS_PORT '6379'  --path="/var/www/html" --allow-root
wp config set WP_REDIS_SCHEME 'tcp'  --path="/var/www/html" --allow-root
wp config set WP_CACHE true --path="/var/www/html" --allow-root
#install pluging and activate it and enable redis
wp plugin install redis-cache --activate --path="/var/www/html" --allow-root
wp redis enable --host=redis --port=6379 --path="/var/www/html" --allow-root

sleep 5
sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf
mkdir run/php
echo "creat run/php floder"
echo "star wordpress" && /usr/sbin/php-fpm7.3 -F 