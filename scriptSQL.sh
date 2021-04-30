#!bin/bash
mysql -u root -p
echo "CREATE DATABASE IF NOT EXISTS ${DOMAIN_NAME};" 
echo "create user ${SQL_USER}@'%' identified with mysql_native_password by '${SQL_PASSWORD}';" 
echo "grant all on ${DB_NAME}.* to ${SQL_USER}@'%';" 
echo "flush privileges;" 
echo "EXIT;" 
