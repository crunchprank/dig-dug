#!/bin/bash 

# dig-dug by crunchprank
# A mass domain dig to csv tool.

# Usage: ./dig-dug.sh domains
# The 'domains' file should contain one domain per line

# By default, the script uses a 300ms delay.
# Sleep is not necessary, but always a nice option.

sleep=0.3

# Don't read lines with 'for'. Use a 'while' loop and 'read'.
while IFS= read -r domain
do
  sleep $sleep
  echo $domain 
# Using +short to avoid auxiliary information.
  ipaddress=`dig $domain +short` 
  nameserver=`dig ns $domain +short`
# Using 'tr' to replace new lines with commas, and strip horizontal whitespace.
# Now with commas as delimiters, software can convert results to spreadsheet.
  ipaddress_space=`echo -e "$ipaddress" | tr '\n' ',' | tr -d "[:blank:]"`
  nameserver_space=`echo -e "$nameserver" | tr '\n' ',' | tr -d "[:blank:]"`
# Outputting to the filename output.csv
  echo -e "$domain,$ipaddress_space$nameserver_space" >> output.csv
done < "$1"
