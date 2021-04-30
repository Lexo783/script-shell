#!/bin/bash

printVirtualHost(){
 touch /var/log/apache2/access.$DOMAIN_NAME.log
 cd /etc/apache2/sites-available
 touch $DOMAIN_NAME.conf
 echo "
  <VirtualHost *:80>
    ServerName $DOMAIN_NAME
    ServerAlias www.$DOMAIN_NAME
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/$DOMAIN_NAME
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined

    <Directory /var/www/$DOMAIN_NAME/>
    	 AllowOverride All
    </Directory>
 </VirtualHost>
" >> $DOMAIN_NAME.conf
}

mkdir /var/www/$DOMAIN_NAME
chown -R $USER:$USER /var/www/$DOMAIN_NAME

printVirtualHost

a2ensite $DOMAIN_NAME
a2dissite 000-default

# return value of test
apache2ctl configtest
systemctl reload apache2

cd /
