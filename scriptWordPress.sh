#!bin/bash

if [ -z $DOMAIN_NAME ]; then
 read -p "Enter your domain : " DOMAIN_NAME
fi

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
 # sed $DIR
else
 echo "Error file didn't exist"
fi
WORDPRESS_KEYS=$(curl -s https://api.wordpress.org/secret-key/1.1/salt/)
cp wp-config.template.php wp-config.copy.php
sed -i 's/word_press_keys/$WORDPRESS_KEYS/g' wp-config.php
mv wp-config.php  /var/www/$DOMAIN_NAME/wp-config.php