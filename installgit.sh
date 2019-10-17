#!/bin/bash
sudo su
yum -y install git
git clone https://github.com/aliyacodes/NTI300.git
cd NTI300/
git config --global user.name "aliyacodes"
git config --global user.email aasken01@seattlecentral.edu
