#!/bin/bash

set -e

[ -f /run/secrets/db_password ] && MYSQL_PASSWORD="$(cat /run/secrets/db_password)"
[ -f /run/secrets/db_root_password ] && MYSQL_ROOT_PASSWORD="$(cat /run/secrets/db_root_password)"

: "${MYSQL_DATABASE:=wordpress}"
: "${MYSQL_USER:=wpuser}"

mkdir -p /var/lib/mysql
chown -R mysql:mysql /var/lib/mysql

if [ -z "$(ls -A /var/lib/mysql 2>/dev/null)" ]; then
  mysql_install_db --user=mysql --datadir=/var/lib/mysql

  mysqld_safe --datadir=/var/lib/mysql --skip-networking &
  for i in $(seq 30); do
    mysqladmin ping >/dev/null 2>&1 && break
    sleep 1
  done

  mysql <<-EOSQL
    CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;
    CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
    GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%';
    FLUSH PRIVILEGES;
EOSQL

  if [ -n "$MYSQL_ROOT_PASSWORD" ]; then
    mysql <<-EOSQL
      ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
      FLUSH PRIVILEGES;
EOSQL
  fi

  mysqladmin shutdown || true
fi

exec mysqld --datadir=/var/lib/mysql --user=mysql
