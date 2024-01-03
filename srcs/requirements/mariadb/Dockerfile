FROM mariadb:latest

COPY ./init.sql /docker-entrypoint-initdb.d/

EXPOSE 3306


VOLUME [ "/var/lib/mysql" ]