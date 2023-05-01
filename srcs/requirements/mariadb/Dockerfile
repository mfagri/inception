FROM debian:buster

# RUN  chmod +x /tools/script.sh
COPY ./tools/script.sh /

RUN apt-get update && apt-get install -y mariadb-server


EXPOSE 3306

COPY ./tools/script.sh /
RUN chmod +x script.sh
CMD [ "./script.sh" ]