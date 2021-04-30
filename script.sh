#!/bin/bash

# set une valeur et l'envoyer dans des scripts enfants DB_NAME=toto #
# export la variable export DB_NAME #
# sh script2.sh #

# rechercher les options possible #

unset DOMAIN_NAME SQL_USER SQL_PASSWORD DB_NAME HELP

while getopts 'hd:u:p:' o
do
    # si il trouve l'option il attribu #
    case $o in
     h) HELP=1;;
     d) DOMAIN_NAME=$OPTARG;;
     u) SQL_USER=$OPTARG;;
     p) SQL_PASSWORD=$OPTARG;;
    esac
done
export DOMAIN_NAME
export SQL_USER
export SQL_PASSWORD
export HELP

usage()
{
  echo "Usage: initialisation
	[ -d ] [ -d DOMAIN_NAME]
	[ -p ] [ -p MYSQL_USER_PASSWORD ]
	[ -u ] [ -u MYSQL_USER_PSEUDO ]
	[ -h ] [ -h HELP ]"
  exit 2
}

help()
{
  echo "Usage: initialisation
	[ -d ] [ -d DOMAIN_NAME] is the domain name like <jesuisundev.com> and is required
	[ -p ] [ -p MYSQL_USER_PASSWORD ] this is the password associated  in your db with your domain name and is required
	[ -u ] [ -u MYSQL_USER_PSEUDO ] this is the user name wich is create on your system and associated to your password and is required
  [ -h ] [ -h HELP ] more information about the script

  EXAMPLE : sudo sh script.sh -d jesuisundev.com -p test_pwd -u test_user
  "
  exit 2
}
if [ $HELP ]; then
 help
fi

if [ -z $DOMAIN_NAME ]; then
 echo "Enter Domaine Name"
 usage
elif [ -z $SQL_USER ]; then
 echo "Enter SQL User"
 usage
elif [ -z $SQL_PASSWORD ]; then
 echo "Enter SQL Password"
 usage
else
 sh scriptDNS.sh
 sh scriptSQL.sh
 sh scriptWordPress.sh
fi
