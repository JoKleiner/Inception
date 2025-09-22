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
define( 'AUTH_KEY',          'e<b)z,C87Q7b@@<s5I@?*Qqx=S@*ynCseR-42a~3Eu#/oaq49ps/4UOVc[D4o[HD' );
define( 'SECURE_AUTH_KEY',   ':Zwmr7)_|bf&2u>d3oq}P/n}giL&9>%`J5^(J&T$pla`;80(xQV~^HYgjg ER8Lg' );
define( 'LOGGED_IN_KEY',     'w+m?;J8v#uQ:|1P@{Ci<>-HtbJC:SQp:qCv<>VGt;9|LvSH9@`NJmpc(.J5q^7P_' );
define( 'NONCE_KEY',         'UD~)FF_UUdI}H,/kVdbSjxAq8,m0WD` G{Lx?:jwKx,Q3p(t`@E(%/7vHR.8WYsU' );
define( 'AUTH_SALT',         'vn^/kmbW<hJW~#1WV`#NXXV)`m/=J.O]}nx$G7|~@P=]_5lpX2gGp;pntr/S>QW1' );
define( 'SECURE_AUTH_SALT',  'Das/MOn~{# 8b|t,@)k!FXW(&]8d>72enHVpXJeb)Z?h}Zb[E(jAXm+D@Os^G4SW' );
define( 'LOGGED_IN_SALT',    '[6?/y{I-)DRoT/l<,D0xJ{Yj<K(BABNf~lxo9j>;CV5L9Pf$qzDz[UScr1nED4&y' );
define( 'NONCE_SALT',        ',tMD;hl@u<CXtb-.Hx|gT gMLQb_tG: ~Tub-WH)1ybHIyG1U!5Fyhx+W8>qCO#s' );
define( 'WP_CACHE_KEY_SALT', ' u]b8%~e}F<?5fa|-+F,lIN4?1RJFMaPsDu*CDt9i;gQ]} 7{?1kc%Aky>g0{u9-' );


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
