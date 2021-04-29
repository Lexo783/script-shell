#!bin/bash

# set une valeur et l'envoyer dans des scripts enfants DB_NAME=toto #
# export la variable export DB_NAME #
# sh script2.sh #

# rechercher les options possible #

unset DOMAIN_NAME SQL_USER SQL_PASSWORD DB_NAME

while getopts 'hd:u:p:n' o
do
    # si il trouve l'option il attribu #
    case $o in
     d) DOMAIN_NAME=$OPTARG;;
     u) SQL_USER=$OPTARG;;
     p) SQL_PASSWORD=$OPTARG;;
     n) DB_NAME=$OPTARG;;
    esac
done
export DOMAIN_NAME
export SQL_USER
export SQL_PASSWORD
export DB_NAME


usage()
{
  echo "Usage: initialisation
	[ -d ] [ -d DOMAIN_NAME]
	[ -p ] [ -p MYSQL_USER_PASSWORD ]
	[ -u ] [ -u MYSQL_USER_PSEUDO ]
	[ -h ] [ -h HELP ]"
  exit 2
}

if [ -z $DOMAIN_NAME ]; then 
 usage
else
 sh scriptDNS.sh
 sh scriptMySql.sh
 sh scriptWordPress.sh
fi
