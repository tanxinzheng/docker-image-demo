# run redis server
```docker
docker-compose up -d
```

# redis cluster run 
docker-compose up之后需运行以下命令进行集群握手
```
# 必须
redis-cli --cluster create 172.16.65.218:7000 172.16.65.218:7001 172.16.65.218:7002 172.16.65.218:7003 172.16.65.218:7004 172.16.65.218:7005 --cluster-replicas 1 -a redis2020

redis-cli --cluster create 127.0.0.1:7000 \
                           127.0.0.1:7001 \
                           127.0.0.1:7002 \
                           127.0.0.1:7003 \
                           127.0.0.1:7004 \
                           127.0.0.1:7005 \
                           --cluster-replicas 1 -a redis2020
```

# 添加集群主从节点
```
redis-cli --cluster create 172.16.65.218:7000 172.16.65.218:7001 172.16.65.218:7002 172.16.65.218:7003 172.16.65.218:7004 172.16.65.218:7005 --cluster-replicas 1 -a redis2020
```

# 添加集群主节点
```
redis-cli --cluster add-node 172.16.65.218:7002 172.16.65.218:7003
```

# 常见文件
- bash: ps: command not found
```
apt-get update && apt-get install procps
```