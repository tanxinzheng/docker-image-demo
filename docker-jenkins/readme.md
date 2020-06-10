# Jenkins

## Docker compose启动
使用docker-compose.yml文件启动。
```
docker-compose up & -d
```

```docker
docker run --name jenkins -d -p 28090:8080 -p 50000:50000 \
-v /Users/jeng/tanxinzheng-repo/docker-repo/docker-image-data/docker-jenkins/data:/var/jenkins_home jenkins
```

```docker

docker exec -it jenkins /bin/bash
docker exec -it -u 0 jenkins /bin/bash
```