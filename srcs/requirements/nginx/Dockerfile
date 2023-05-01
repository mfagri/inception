FROM debian:buster
#install ngnix and opensll
RUN apt-get update && apt-get install -y nginx && apt-get install -y openssl && apt install -y php php-fpm

#creat dir
RUN mkdir /etc/nginx/ssl

# get ssl certificate 
RUN openssl req -newkey rsa:4096 -x509 -days 365 -nodes \
       -out /etc/nginx/ssl/mfagri.crt \
       -keyout /etc/nginx/ssl/mfagri.key \
       -subj "/C=MO/L=KH"

COPY nginx.conf /etc/nginx/conf.d
#run ngnix  foreground
CMD ["nginx", "-g", "daemon off;"]