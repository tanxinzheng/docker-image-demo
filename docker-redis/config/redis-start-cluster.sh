#!/bin/bash

redis-server /etc/redis/redis_cluster_7000.conf 
redis-server /etc/redis/redis_cluster_7001.conf 
redis-server /etc/redis/redis_cluster_7002.conf 

exit 1