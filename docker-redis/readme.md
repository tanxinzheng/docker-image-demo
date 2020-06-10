# run redis server
```docker
docker-compose up -d
```

# redis cluster run 
docker-compose up之后需运行以下命令进行集群握手
```
redis-cli --cluster create 127.0.0.1:7000 127.0.0.1:7001 127.0.0.1:7002 127.0.0.1:7003 127.0.0.1:7004 127.0.0.1:7005 --cluster-replicas 1
```

# 常见文件
- bash: ps: command not found
```
apt-get update && apt-get install procps
```