#!/bin/bash

if [ -z $1 ]
then
        echo "Please specify the program or service you would like to install. "
        exit 0;

fi

status=$(rpm -q $1 | grep Installed | awk '{print $2}')
installed=$(rpm -q $1 | grep $1 | awk '{print $2}')

if [[ $status != $installed ]]
then

        echo "--> ${1} is not installed."
        read -p "--> Would you like to install ${1}? [y/n] " yn
                case $yn in
                        [Yy]* ) yum -y install $1;;
                        [Nn]* ) echo "### Exiting installation program."; exit 0;;
                        * ) echo "--> Please answer yes or no.";; #fix
                esac
        read -p "--> Would you like to start ${1}? [y/n] " yn
                case $yn in
                        [Yy]* ) systemctl start $1;;
                        [Nn]* ) echo "### Exiting activation program."; exit 0;;
                        * ) echo "--> Please answer yes or no.";; #fix
                esac
else
        echo "--> ${1} is installed"
        status=$(systemctl status $1 | grep Active | awk '{print $2}')
        inactive='inactive'
                if [[ $status == $inactive ]]
                then
                        read -p "--> Would you like to start ${1}? [y/n] " yn
                                case $yn in
                                        [Yy]* ) systemctl start $1;;
                                        [Nn]* ) echo "### Exiting activation program."; exit 0;;
                                        * ) echo "--> Please answer yes or no.";; #fix
                                esac
                        echo "--> ${1} is now ${status}."
                else
                        echo "--> ${1} is ${status}."
                fi

fi
