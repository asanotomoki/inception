#!/bin/sh


curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

if [ ! -f /var/www/html/wp-config.php ]; then
    cp /tmp/wp-config.php /var/www/html/wp-config.php
fi
if [ ! -f /var/www/html/wp-admin ]; then
    wp core download --allow-root --path=/var/www/html
fi


wp core install --allow-root --path=/var/www/html --url=localhost --title=tasano --admin_user=wordpress --admin_password=wordpress --admin_email=email@example.com

mv /tmp/www.conf /etc/php/7.4/fpm/pool.d/www.conf

php-fpm7.4 -F