#!bin/bash

if [ -z $DOMAIN_NAME ]; then
 read -p "Enter your domain : " DOMAIN_NAME
fi

if [ -z $DB_NAME ]; then
 read -p "Enter your sql db name : " DB_NAME
fi

if [ -z $SQL_USER ]; then
 read -p "Enter your sql pseudo : " SQL_USER
fi

if [ -z $SQL_PASSWORD ]; then
 read -p "Enter your sql password : " SQL_PASSWORD
fi

print(){

 echo "\n /**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key>
 * You can change these at any point in time to invalidate all existing cookies>
 *
 * @since 2.6.0
 */

 $WORDPRESS_KEYS

 /**#@-*/" >>  wp-config.copy.php

}

DIR="/var/www/${DOMAIN_NAME}"
mkdir $DIR

useradd codingfactory
sudo adduser codingfactory www-data

grep ww-data /etc/group

if [ -d $DIR ]; then
 # Take action if $DIR exists. #
 echo "Installing website on /tmp ..."
 cd /tmp
 curl -O https://wordpress.org/latest.tar.gz
 tar xzvf latest.tar.gz
 touch /tmp/wordpress/.htaccess
 cp /tmp/wordpress/wp-config-sample.php /tmp/wordpress/wp-config.php
 mkdir /tmp/wordpress/wp-content/upgrade
 sudo cp -a /tmp/wordpress/. $DIR

 WORDPRESS_KEYS=$(curl -s https://api.wordpress.org/secret-key/1.1/salt/)
 cd /projetGit
 cp wp-config.template.php wp-config.copy.php

 sed -i -e s/database_name_here/${DB_NAME}/g 'wp-config.copy.php'
 sed -i -e s/username_here/${SQL_USER}/g 'wp-config.copy.php'
 sed -i -e s/password_here/${SQL_PASSWORD}/g 'wp-config.copy.php'

 print

 mv /var/www/$DOMAIN_NAME/wp-config.php /var/www/$DOMAIN_NAME/wp-oldconfig.php
 mv wp-config.copy.php /var/www/$DOMAIN_NAME/wp-config.php
 echo https://$WORDPRESS_KEYS
else
 echo "Error file didn't exist"
fi
