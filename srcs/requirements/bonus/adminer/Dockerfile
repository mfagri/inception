

FROM debian:buster

# Install required packages
RUN apt-get update && \
    apt-get install -y php-fpm php-mysql wget && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /run/php
RUN mkdir /var/www/

# Download and extract the latest Adminer release
RUN wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php -O /var/www/adminer.php && \
    chown www-data:www-data /var/www/adminer.php

COPY ./tools/www.conf /etc/php/7.3/fpm/pool.d
RUN chown -R www-data:www-data /var/www/adminer.php
RUN chmod 755 /var/www/adminer.php


# Start services
CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize", "--allow-to-run-as-root"]
