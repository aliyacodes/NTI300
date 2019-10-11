#!/bin/bash
yum -y install wget
https://raw.githubusercontent.com/aliyacodes/NTI300/master/packages.txt
for packages in $(cat packages.txt); do 
   yum -y install $packages
done
