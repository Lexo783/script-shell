<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'rg' );

/** MySQL database username */
define( 'DB_USER', 'gr' );

/** MySQL database password */
define( 'DB_PASSWORD', 'gr' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );


/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';

 /**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */ 
 
 define('AUTH_KEY',         '3.D 3>&Mxx}tK~a4t;HB!YLt:HVr|_,Zq4;!oyp}d^~rQ;qt7J??n`4-}yN;)4Ei');
define('SECURE_AUTH_KEY',  'NRYZELr;?Wls0(Zkz}Z#vi~t0>JS^%[Rk-YG2PR?k5c.+Ec7r4 c~kHjL6-U)5u*');
define('LOGGED_IN_KEY',    '-%jWvhl%>C0XWMf;DiKE6_&$Y[Qm:F 7H|u5l;oFdLFCk;m~+1OJIev1k6:1s#G1');
define('NONCE_KEY',        'J#Sj-Xo;m:B*>EX}i)Qe&ycA=w^0HM*LC[V)Cm~b]&@fV{da&-HoQ]ua6TWKTdRf');
define('AUTH_SALT',        '1$38^,YB^ovtPy>Eh59_.tOfiV` zFd~+UZGC_9z:r:7/!/i~SZwCP4<wA<l(L|F');
define('SECURE_AUTH_SALT', '&LAmO|tMRN:[RSL727J7)-:Jeg8V}PR|8:k/^+L3!4t%{6IaPKN=+()dnc++SQ-:');
define('LOGGED_IN_SALT',   'r7|E~nIUJ:q}g.ce:{*J.|N6x~JqCvS5},); n^j]m [YiN8w!Fa_mWuk(/1Ajzw');
define('NONCE_SALT',       '$f9PomuBE;,Bn<&..PlFB{=P{q~|SB$qq[t]}V4u#)+x=FAYENw8O(MI{z|>(!U5'); 
 
 /**#@-*/
