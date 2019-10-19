# run redis server
```docker
docker run -d -ti \
-p 6379:6379 \
-v /Users/jeng/tanxinzheng-repo/docker/docker-image-demo/docker-redis/conf/redis.conf:/etc/redis/redis.conf \
-v /Users/jeng/tanxinzheng-repo/docker/docker-image-demo/docker-redis/data:/data \
--restart always \
--name local-redis \
daocloud.io/redis \
redis-server /etc/redis/redis.conf
```