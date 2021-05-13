#!/bin/bash

source ./common.sh

#install harbor
./install_harbor.sh

#install mongo
./install_mongo.sh

#create mongo user and db
./create_mongo_db_user.sh

#install redis
./install_redis.sh

#install clair
./install_clair.sh
