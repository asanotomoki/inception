FROM debian:11.0

RUN apt-get update && apt-get upgrade -y

EXPOSE 9000
RUN apt-get install -y php7.4 php7.4-fpm curl php7.4-mysql php7.4-mbstring php7.4-xml php7.4-gd php7.4-curl php7.4-zip php7.4-intl php7.4-soap php7.4-xmlrpc php7.4-ldap
RUN mkdir -p /run/php

COPY tools/docker-entrypoint.sh /bin/docker-entrypoint.sh
COPY tools/wp-config.php /tmp/wp-config.php
COPY tools/www.conf /tmp/www.conf

RUN chmod 755 /bin/docker-entrypoint.sh

VOLUME [ "/var/www/html" ]


ENTRYPOINT ["/bin/docker-entrypoint.sh"]
