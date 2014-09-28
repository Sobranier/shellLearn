#!/bin/bash
PATH=/Users/sobranie/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin
export PATH

read -p "Input your first name : " firstname
read -p "Input your last name : " lastname
echo "\nYour full name is : $firstname $lastname"

echo "\nI will use 'touch' command to create 3 files"
read -p "Please input your filename : " fileuser
filename=${fileuser:-"filename"}

#date1=$(date -d '-2 days ago' +%Y%m%d)
#date2=$(date -d '-1 days ago' +%Y%m%d)
date3=$(date +%Y%m%d)

#file1=${filename}${date1}
#file2=${filename}${date2}
file3=${filename}${date3}

#touch "$file1"
#touch "$file2"
touch "$file3"
