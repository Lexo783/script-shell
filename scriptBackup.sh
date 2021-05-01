#!bin/bash

DOMAIN_NAME=unset
SQL_USER=unset
SQL_NAME=unset
IPVM=unset
USERVM=unset

while getopts 'u:n:i:e:' o
do
    # si il trouve l'option il attribu #
    case $o in
     u) SQL_USER=$OPTARG;;
     n) SQL_NAME=$OPTARG;;
     i) IPVM=$OPTARG;;
     e) USERVM=$OPTARG;;
    esac
done

usage()
{
  echo "Usage: initialisation
    [ -u ] [ -u MYSQL_USER]
    [ -n ] [ -n DATABASE_NAME ]
    [ -i ] [ -i YOUR_IP_VM ]
    [ -e ] [ -e USER_VM ]"
  exit 2
}

if [ -z $IPVM ]; then
 usage
fi
if [ -z $USERVM ]; then
 usage
fi
tar -cz /var/www | (cd /var/www ; tar -xvz)
cd /var/www
cp -r var /var/backups
rm -r var
cd /var/backups
mv var date-codingvm
cd /date-codingvm
mysqldump -u $SQL_USER -p $SQL_NAME > $SQL_NAME-backup.sql

scp -r /var/backups/date-codingvm $USERVM@$IPVM:~/
