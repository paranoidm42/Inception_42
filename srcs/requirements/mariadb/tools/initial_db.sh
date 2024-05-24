#!/bin/sh


echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" > /initial_db.sql
echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" >> /initial_db.sql
echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';" >> /initial_db.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" >> /initial_db.sql
echo "FLUSH PRIVILEGES;" >> /initial_db.sql

service mysql start

until mysqladmin ping -h localhost >/dev/null 2>&1; do
  echo "Waiting for MariaDB to be fully started..."
  sleep 2
done

mysql < /initial_db.sql

exec mysqld
