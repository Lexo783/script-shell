#!bin/bash

tar -cz /var/www | (cd /var/www ; tar -xvz)
cd /var/www
cp -r var /var/backups
rm -r var
cd /var/backups
mv var date-codingvm

scp -r /var/backups/date-codingvm back@192.168.1.32:/var/backups
