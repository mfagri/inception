FROM debian:buster

RUN apt-get update && apt-get install -y nginx && apt-get install -y openssl
# get ssl certificate 
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=MO/L=KH/O=1337/OU=student/CN=mfagri.42.ma"
COPY index.html /var/www/html/

COPY nginx.conf /etc/nginx/conf.d
CMD ["nginx", "-g", "daemon off;"]


EXPOSE 80