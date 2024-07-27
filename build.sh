#!/bin/bash
export BUILD_TAG=$(date +%Y%m%d)
docker compose down
docker rm cassandra5
docker rmi infobarbosa/cassandra5
docker build --no-cache --progress=plain -t infobarbosa/cassandra5:$BUILD_TAG  . &> build.log

#docker compose up -d --build --force-recreate >> build.log

docker image tag infobarbosa/cassandra5:$BUILD_TAG infobarbosa/cassandra5:latest
docker image tag infobarbosa/cassandra5:$BUILD_TAG infobarbosa/cassandra5:$BUILD_TAG
