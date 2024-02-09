FROM debian:bullseye

EXPOSE 9000
RUN apt-get update && apt-get install -y php7.4 php7.4-fpm curl php7.4-mysql    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/php

COPY tools/docker-entrypoint.sh /bin/docker-entrypoint.sh
COPY tools/wp-config.php /tmp/wp-config.php
COPY tools/www.conf /tmp/www.conf

RUN chmod 755 /bin/docker-entrypoint.sh

VOLUME [ "/var/www/html" ]

ENTRYPOINT ["/bin/docker-entrypoint.sh"]
