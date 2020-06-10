#!/bin/bash

redis-server /etc/redis/redis_cluster_7000.conf & redis-server /etc/redis/redis_cluster_7001.conf & redis-server /etc/redis/redis_cluster_7002.conf & redis-cli --cluster create 172.25.0.5:7000 172.25.0.6:7000 172.25.0.7:7000 172.25.0.8:7000 172.25.0.9:7000 172.25.0.10:7000 --cluster-replicas 1