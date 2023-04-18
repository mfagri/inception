#!/bin/bash



service mysql start 

sleep 10
echo $DB_NAME

echo "CREATE DATABASE IF NOT EXISTS $DB_NAME ;" > torun.sql
echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS' ;" >> torun.sql
echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' ;" >> torun.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '12345' ;" >> torun.sql
echo "FLUSH PRIVILEGES;" >> torun.sql

mysql < torun.sql
sed -i 's/127\.0\.0\.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

kill $(cat /var/run/mysqld/mysqld.pid)


mysqld

# docker run -it --name mariadb -p 3306:3306 --network my-network img-mariadb bash
# docker run -it --name mariadb -p 3306:3306 --network my-network img-mariadb bash
# docker run -it --name wordpress -p 9000:9000 --network my-network img-wordpress
#  docker network create my-network