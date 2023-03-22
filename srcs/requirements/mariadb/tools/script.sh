#!/bin/bash


# ENV_NAME=eminem
# # MySQL root credentials
# MYSQL_USER=root
# MYSQL_PASS=maroun5

# # New database name and user credentials
# DB_NAME=mydata
# DB_USER=mfagri
# DB_PASS=mfagri1337
# NEW_PASS=12345

# service mysql start

# echo $ENV_NAME


# if mysql -u $MYSQL_USER -p$MYSQL_PASS -e "SHOW DATABASES LIKE '$DB_NAME';" | grep "$DB_NAME" >/dev/null; then #check if database exists.
#     echo "Database $DB_NAME already exists."
# else
#     mysql -u $MYSQL_USER -p$MYSQL_PASS -e "CREATE DATABASE $DB_NAME;"
#     echo "Database $DB_NAME created."
# fi

# mysql -u $MYSQL_USER -p$MYSQL_PASS -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS' ;"
# mysql -u $MYSQL_USER -p$MYSQL_PASS -e "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_USER';" # Add new user and grant all privileges on the new database


# mysql -u $MYSQL_USER -p$MYSQL_PASS -e "SET PASSWORD FOR '$MYSQL_USER'@'localhost' = PASSWORD('$NEW_PASS');" # Change password for user
# # show databases and users
# mysql -u ${MYSQL_USER} -p${MYSQL_PASS} -e 'SHOW DATABASES'
# mysql -u ${MYSQL_USER} -p${MYSQL_PASS} -e  "SELECT User FROM mysql.user;"

# tail -f
# docker run -it --name mariadb -p 3306:3306 --network my-network img-mariadb bash
# docker run -it --name mariadb -p 3306:3306 --network my-network img-mariadb bash
# docker run -it --name wordpress -p 9000:9000 --network my-network img-wordpress
#  docker network create my-network

# mysql -u $MYSQL_USER -p$MYSQL_PASS -e"CREATE DATABASE IF NOT EXISTS $DB_NAME ;"
# echo "strat mfagri"
# mysql -u $MYSQL_USER -p$MYSQL_PASS -e"CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS' ;"
# mysql -u $MYSQL_USER -p$MYSQL_PASS -e"GRANT ALL PRIVILEGES ON $$DB_NAME.* TO '$DB_USER'@'%' ;"
# mysql -u $MYSQL_USER -p$MYSQL_PASS -e"UPDATE mysql.user SET authentication_string = PASSWORD('$NEW_PASS') WHERE User = 'root';"
# mysql -u $MYSQL_USER -p$MYSQL_PASS -e"FLUSH PRIVILEGES;"

# kill $(cat /var/run/mysqld/mysqld.pid)

# service mysql start
# mysqld
service mysql start 
sleep 10
# touch /var/run/mysqld/mysqld.sock
echo $DB_NAME

echo "CREATE DATABASE IF NOT EXISTS $DB_NAME ;" > db1.sql
echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS' ;" >> db1.sql
echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' ;" >> db1.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '12345' ;" >> db1.sql
echo "FLUSH PRIVILEGES;" >> db1.sql

mysql < db1.sql
sed -i 's/127\.0\.0\.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld