#!/bin/sh


echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" > /initial_db.sql
echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" >> /initial_db.sql
echo "GRANT ALL   ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';" >> /initial_db.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" >> /initial_db.sql
echo "FLUSH PRIVILEGES;" >> /initial_db.sql

service mysql start

if mysql < /initial_db.sql; then
  echo "Database and user created"
else
  echo "Something went wrong but don't wory if wordpress work!!"
fi

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld
