#!bin/bash

echo "CREATE DATABASE IF NOT EXISTS ${DOMAIN_NAME};" | mysql -u root -p
echo "create user ${SQL_USER}@'%' identified with mysql_native_password by '${SQL_PASSWORD}';" | mysql -u root -p
echo "grant all on ${DB_NAME}.* to ${SQL_USER}@'%';" | mysql -u root -p
echo "flush privileges;" | mysql -u root -p
