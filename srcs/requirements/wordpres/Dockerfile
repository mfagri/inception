FROM debian:buster
# WORKDIR /var/www/html

RUN apt-get update && \
    apt install -y php php-fpm && apt-get install -y curl

# COPY wordpress /var/www/html

RUN chmod +x wp-cli.phar 
RUN mv wp-cli.phar /usr/local/bin/wp
RUN wp core download --allow-root