#!/bin/bash

dbname="xxx"
dbuser="xxx"
dbpassword="xxx"

#create db 
docker exec -it mongo_mongo_1 bash -c "echo -e 'use admin\ndb.auth(\"root\",\"example\")\nuse ${dbname}\ndb.createUser({user:\"${dbuser}\",pwd:\"${dbpassword}\",roles:[{role:\"dbOwner\",db:\"${dbname}\"}],mechanisms : [\"SCRAM-SHA-1\"]})' > create_db_user.js"

#exec js
docker exec -it mongo_mongo_1 bash -c "mongo < create_db_user.js"

