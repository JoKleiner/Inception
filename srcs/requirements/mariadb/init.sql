CREATE DATABASE IF NOT EXISTS wordpress;

DROP USER IF EXISTS 'wpuser'@'wordpress.inception_inception';

CREATE USER 'wpuser'@'wordpress.inception_inception' IDENTIFIED BY 'secure_db_password';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wpuser'@'wordpress.inception_inception';
FLUSH PRIVILEGES;
