#!/bin/bash 
sleep=0.1
while IFS= read -r domain
do
  sleep $sleep
  echo $domain 
  ipaddress=`dig $domain +short` 
  nameserver=`dig ns $domain +short`
  nameserver_space=`echo -e "$nameserver" | tr '\n' ',' | tr -d "[:blank:]"`
  echo -e "$domain,$ipaddress,$nameserver_space" >> output.csv
done < "$1"
