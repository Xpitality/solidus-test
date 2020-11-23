#!/usr/bin/sh
docker rm $(docker ps -q -a) -f && docker rmi $(docker images -q) -f
docker network prune -f
docker volume prune -f