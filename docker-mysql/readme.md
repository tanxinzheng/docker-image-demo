## mysql docker

### mysql dockerfile document
https://hub.docker.com/_/mysql/

### 构建镜像
```
docker pull mysql:5.7.19
```

###
```
启动Mysql容器
docker run --name mysql -p 3306:3306 \
-v /Users/jeng/tanxinzheng-repo/docker-repo/docker-image-data/docker-mysql/logs2:/var/log \
-v /Users/jeng/tanxinzheng-repo/docker-repo/docker-image-data/docker-mysql/data2:/var/lib/mysql \
-e MYSQL_ROOT_PASSWORD=123456 \
-d mysql:5.7.19 \
--character-set-server=utf8 \
--collation-server=utf8_unicode_ci \
--sql_mode=STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION

进入容器内部
sudo docker exec -it mysql /bin/bash
```