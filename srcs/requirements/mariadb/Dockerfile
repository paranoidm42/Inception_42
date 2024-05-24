FROM debian:buster

RUN apt update && apt install -y mariadb-server

EXPOSE 3306

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/initial_db.sh /

RUN chmod +x /initial_db.sh

ENTRYPOINT ["/initial_db.sh"]
