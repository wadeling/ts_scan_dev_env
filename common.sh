#!/bin/bash

function LOG()
{
    echo -e "[`date +"%F %T"`] $*"
}

function get_local_ip()
{
	local_ip=`ip addr show eth0 | grep inet | grep -v inet6 | awk '{print $2}' | awk -F '/' '{print $1}'`
	echo $local_ip
}
