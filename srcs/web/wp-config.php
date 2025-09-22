<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * Localized language
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'wpuser' );

/** Database password */
define( 'DB_PASSWORD', 'password' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',          'bLYXiAp|yj`LwFd@q!D.k|zDgBk_#cH/uo)9Mbe)%^V!%~VcwjWwgS1Kc~v~^K|9' );
define( 'SECURE_AUTH_KEY',   'E.?m3=c6V73)4)n5};^TVoE$qk:IWripjgq;/OB:C9kn~7yBl]EK:otEZS4{8n,|' );
define( 'LOGGED_IN_KEY',     'a-wdB$X(Ly=*kE@U^SUrq&x+f2^T nzaaR0&b7w^{%!.Bn=Y%x%s#dnqQ?ME#{n1' );
define( 'NONCE_KEY',         'qv+g83@`c@Lk.d~P&_I+s >yri<D{fWt:@hK{SS,AClZM{v-@}k_E?_<<JSN-YJ)' );
define( 'AUTH_SALT',         '0rtp[,CaBd*L<g%F6?13BWsr^SE[%-HPgo`CmOAZbZ1 _h[v#m~bX-qiSV-$5Ar-' );
define( 'SECURE_AUTH_SALT',  'Ho,o#3i%yS kA>tbzST?HBF&bC#Q(s/<-fu2*i3~uA!faqa{^M.jK2l4wzUXg)(-' );
define( 'LOGGED_IN_SALT',    '6x<??Mbd9)9lt4pY/lt0dJ$;>)5Pt3BJobT)qJ7{t^XLH`.*,(G:Y7oFviw{[B_4' );
define( 'NONCE_SALT',        'r@r4uKIE9&]7=K}!qQ#Q0+r[42r^z=)$&zva[,#r4_Q&H:mnT7bb^5W90FV(8VA|' );
define( 'WP_CACHE_KEY_SALT', 'q=WK!hW!FpRjFPX2VvJ-~dYm`M(fW*>7R`M j-s)r!*{FP@!cYQO;(!WRnMC?#7L' );


/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';


/* Add any custom values between this line and the "stop editing" line. */



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
if ( ! defined( 'WP_DEBUG' ) ) {
	define( 'WP_DEBUG', false );
}

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
