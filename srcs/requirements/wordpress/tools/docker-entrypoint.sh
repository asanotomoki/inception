#!/bin/sh
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp


if [ ! -f /var/www/html/wp-config.php ]; then
    cp /tmp/wp-config.php /var/www/html/wp-config.php
    sed -i "s/WP_DB_NAME/$DB_NAME/g" /var/www/html/wp-config.php
    sed -i "s/WP_DB_USER/$DB_USER/g" /var/www/html/wp-config.php
    sed -i "s/WP_DB_PASSWORD/$DB_PASSWORD/g" /var/www/html/wp-config.php
fi
if [ ! -f /var/www/html/wp-admin ]; then
    wp core download --allow-root --path=/var/www/html
fi

wp core install --allow-root --path=/var/www/html --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL

echo $DOMAIN_NAME $WP_TITLE $ADMIN_USER $ADMIN_PASSWORD $ADMIN_EMAIL
mv /tmp/www.conf /etc/php/7.4/fpm/pool.d/www.conf

php-fpm7.4 -F