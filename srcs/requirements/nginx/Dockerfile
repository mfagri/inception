FROM debian:latest

RUN apt-get update && apt-get install -y nginx

COPY index.html /var/www/html/

COPY nginx.conf /etc/nginx/conf.d
CMD ["nginx", "-g", "daemon off;"]


EXPOSE 80