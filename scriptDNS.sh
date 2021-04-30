#!bin/bash

printVirtualHost(){
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
 </VirtualHost>
 <Directory /var/www/wordpress/>
    AllowOverride All
 </Directory>
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
