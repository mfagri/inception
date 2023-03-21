FROM debian:buster
# WORKDIR /var/www/html

RUN apt-get update && \
    apt install -y php php-fpm && apt-get install -y curl &&  apt-get install -y mariadb-server && apt-get install -y php-mysql

# COPY wordpress /var/www/html
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN wp core download --allow-root


RUN wp config create --dbname=mydata --dbuser=mfagri --dbpass=mfagri1337 --dbhost=mariadb  --allow-root
RUN wp core install --url=mfagri.1337.ma/ --title=mfagri --admin_user=mfagri --admin_password=mfagri1337 --admin_email=mfagri@gmail.com --skip-email --allow-root
RUN sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf
RUN wp user create mfagri mfagri@1337.com --role=author --user_pass=1234 --allow-root
RUN theme install astra --activate --allow-root
# wp plugin install redis-cache --activate --allow-root
# wp plugin update --all --allow-root
# apt-get install php-mysql

RUN mkdir run/php
RUN ./usr/sbin/php-fpm7.3  -F