# FROM mariadb:latest
# EXPOSE 3306
# VOLUME [ "/var/lib/mysql" ]

FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y mariadb-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


COPY tool/docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

COPY tool/my.cnf /etc/mysql/

# VOLUME [ "/var/lib/mysql" ]

ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.sh" ]

EXPOSE 3306

CMD [ "mysqld" ]