
#!bin/bash

unset DOMAIN_NAME

while getopts 'd:' o
do
    # si il trouve l'option il attribu #
    case $o in
     d) DOMAIN_NAME=$OPTARG;;
    esac
done
export DOMAIN_NAME



usage()
{
  echo "Usage: initialisation
	[ -d ] [ -d DOMAIN_NAME]"
  exit 2
}

if [ -z $DOMAIN_NAME ]; then 
 usage
else
error='"POST /wp-login.php HTTP/1.1" 200'
ips=`grep "$error" "/var/log/apache2/access.log" | cut -d' ' -f1`

echo "$ips" > $DOMAIN_NAME.copy.txt
echo `sort $DOMAIN_NAME.copy.txt | uniq -c ` > $DOMAIN_NAME.copy.txt

num_error_ips=`cut -d' ' -f1 $DOMAIN_NAME.copy.txt`
                if [ $num_error_ips -ge 5 ]; then
                        ip_ban=`cut -d' ' -f2 $DOMAIN_NAME.copy.txt`
                        echo "try number = $num_error_ips / ip ban = $ip_ban"
                        iptables -A INPUT -s $ip_ban -j DROP
                fi
echo "${data}"
rm -r $DOMAIN_NAME.copy.txt
fi
