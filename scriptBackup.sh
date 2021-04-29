#!bin/bash

DOMAIN_NAME=unset
SQL_USER=unset
SQL_NAME=unset

while getopts 'u:n:' o
do
    # si il trouve l'option il attribu #
    case $o in
     u) SQL_USER=$OPTARG;;
     n) SQL_NAME=$OPTARG;;
    esac
done



tar -cz /var/www | (cd /var/www ; tar -xvz)
cd /var/www
cp -r var /var/backups
rm -r var
cd /var/backups
mv var date-codingvm
cd /date-codingvm
mysqldump -u $SQL_USER -p $SQL_NAME > $SQL_NAME-backup.sql

scp -r /var/backups/date-codingvm back@192.168.1.32:~/
