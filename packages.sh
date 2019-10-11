#!/bin/bash
if [ -e /usr/bin/wget ]; then
   exit 0;
 fi
yum -y install wget
https://raw.githubusercontent.com/aliyacodes/NTI300/master/packages.txt
for packages in $(cat packages.txt); do 
   yum -y install $packages
done
