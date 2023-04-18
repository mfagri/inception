FROM debian:buster

# RUN  chmod +x /tools/script.sh
COPY ./tools/script.sh /

RUN apt-get update && apt-get install -y mariadb-server


EXPOSE 3306

COPY ./tools/script.sh /
RUN chmod +x script.sh
CMD [ "./script.sh" ]


#Command to launch mariadb and enable the database to listen globally - also can be put on mysqldump.cnf file
# CMD ["mysqld", "--bind-address=0.0.0.0"]
# # Wait for the server to start
# RUN sleep 20
# RUN tail -f
# # Connect to the server and create a test database
# RUN mysql -h 127.0.0.1 -P 3306 -u root -e "CREATE DATABASE test;"
