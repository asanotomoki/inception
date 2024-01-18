<?php
// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', $_ENV['WORDPRESS_DB_NAME']);

/** MySQL database username */
define('DB_USER', 'root');

/** MySQL database password */
define('DB_PASSWORD', '123456');

/** MySQL hostname */
define('DB_HOST', $_ENV['WORDPRESS_DB_HOST']);

/** Database Charset to use in creating database tables.*/
define('DB_CHARSET', 'utf8');

/** The Database Collate type.Don't change this if in doubt.*/
define('DB_COLLATE', '');

$table_prefix  = 'wp_';

define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';

