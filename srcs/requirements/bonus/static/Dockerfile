FROM debian:buster

RUN apt-get update && \
    apt-get install -y && apt-get install -y nginx 


COPY tools/index.html /var/www/html
COPY tools/mystyle.css /var/www/html
COPY tools/menu.png /var/www/html
COPY tools/Joe_Goldberg-removebg-preview.png /var/www/html

CMD ["nginx", "-g", "daemon off;"]

EXPOSE 80