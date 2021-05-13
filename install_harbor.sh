#!/bin/bash

source ./common.sh

#get local ip
local_ip=`get_local_ip`
LOG $local_ip

#install harbor
curl -LO https://github.com/goharbor/harbor/releases/download/v2.2.1/harbor-online-installer-v2.2.1.tgz
tar -zxvf harbor-online-installer-v2.2.1.tgz
cd harbor
cp harbor.yml.tmpl harbor.yml
#set harbor host ip
sed -i "s/reg.mydomain.com/${local_ip}/g" harbor.yml
#not use https
sed -i "13,18s/^/#/" harbor.yml 
#install
./install.sh
