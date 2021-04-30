# Script-Shell

---

a script that makes it easier than ever to launch a server and a backup.

---

## git!

https://github.com/Lexo783/script-shell

# Required befor start script

start apache on your server if apache is not install (https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-ubuntu-20-04-fr)

if apache is install start the service
***
Prevent Apache from starting automatically
>sudo systemctl enable apache2
***
install mysql
>sudo apt install mysql-server
>
>sudo mysql_secure_installatio
***
for more information about mysql installation (https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-ubuntu-20-04-fr)
***
install php

>sudo apt install php libapache2-mod-php php-mysql
php -v
***
## script Installation du domain

script for install you domain name with a wordpress

>sh script.sh -d domain_name -p db_password -u db_pseudo -n db_name
***

## script de firewall et du logger

the script will ask you to enter the domain you want to log in, don't get the wrong name!

start the script

>cd /logger
>
>python3 watcher.py
***

If an ip tries to connect to your wordpress site and fails 5 times then the ip will definitely be banned, You can list all your ip ban by.

>iptables -L INPUT -v -n
>

If you stop the script you are no longer protected and the ip will be unban

## script de backup

Script for save you db and hostn files on your vm in /var/backups


>sh scriptBackup.sh
***

## Contributing

members of the coding factory, [Florent](https://github.com/Lexo783), [Houssam](https://github.com/houssamlaghzil), [Erwan](), [Francesco](https://github.com/Francesco-HART)
