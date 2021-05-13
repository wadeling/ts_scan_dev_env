#!/bin/bash

#get local ip
local_ip=`ip addr show eth0 | grep inet | grep -v inet6 | awk '{print $2}' | awk -F '/' '{print $1}'`
echo "local ip:${local_ip}"

dbname="xxx"
dbuser="xxx"
./scanner --mongo-endpoint=${local_ip}:27017 --mongo-database=${dbname} --mongo-username=${dbuser} --clair-remote-address=${local_ip} \
	--clair-address=${local_ip} --clair-port=9278 --clair-postgresconnectionstring=postgres://postgres:password@${local_ip}:5432/postgres?sslmode=disable \
	--clair-secretpattern=./config/patterns.json --redclair-skipregistrytlsverify --redis-endpoint=${local_ip}:6379 \
	--harbor-username=admin --harbor-url=http://${local_ip}:80 --harbor-skiptlsverify -v



