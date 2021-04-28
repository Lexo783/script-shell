#!bin/bash

mkdir /var/www/$DOMAIN_NAME
chown -R $USER:$USER /var/www/$DOMAIN_NAME

# a faire  sed  /etc/apache2/sites-available/$DOMAIN_NAME.conf
a2ensite $DOMAIN_NAME
a2dissite 000-default

# return value of test
sudo apache2ctl configtest
sudo systemctl reload apache2
