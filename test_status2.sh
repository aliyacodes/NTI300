#!/bin/bash

#if nothing entered, prompt for argument
if [ -z "$1" ] ; then
    echo "Please specify the service or package you would like to install."
fi

# Test to see if the package/service being queried about is actually installed.  
rpm -q $1
status=$(systemctl status $1 | grep Installed | awk '{print $2}')
uninstalled='uninstalled'

# If not, prompt the user to see if they would like it installed, then do so if they would 
# or exit 0 if they would not.
while true; do
    read -p "Would you like to install this program? [y/n]" yn
    case $yn in
        [Yy]* ) sudo yum -y install $1; break;;
        [Nn]* ) exit 0;;
        * ) echo "Please answer yes or no.";;
    esac
done

# If the service is off, prompt the user to see if they would like it turned on.  
# If they do want it turned on, start the service, 
# if not, exit 0.
if [ -z "$1" ] ; then
    echo "Please specify the service or package you would like turned on"
fi

# Test to see if the package/service being queried about is active. 
rpm -q $1
status=$(systemctl status $1 | grep Active | awk '{print $2}')
inactive='inactive'

if [[ $status == $inactive ]]; then
read -p "Would you like to turn on this service? [y/n]" yn
    case $yn in
            [Yy]* ) sudo systemctl start $1;;
            [Nn]* ) exit 0;;
            * ) echo "Please answer yes or no.";;
    esac
fi

echo "-----------------------------------------------------------------"
sudo ps aux | grep $1

