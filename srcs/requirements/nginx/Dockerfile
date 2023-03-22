FROM debian:buster

RUN apt-get update && apt-get install -y nginx && apt-get install -y openssl && apt install -y php php-fpm
# get ssl certificate 
# RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=MO/L=KH/O=1337/OU=student/CN=mfagri.42.ma"
RUN mkdir /etc/nginx/ssl

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
       -out /etc/nginx/ssl/mfagri.crt \
       -keyout /etc/nginx/ssl/mfagri.key \
       -subj "/C=MO/L=KH/O=1337/OU=student/CN=mfagri.42.ma"

# COPY index.html /var/www/html
# 
COPY nginx.conf /etc/nginx/conf.d
COPY default etc/nginx/sites-available/default

CMD ["nginx", "-g", "daemon off;"]

