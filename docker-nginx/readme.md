# 基于Docker搭建Nginx服务

## 创建镜像
```docker
docker build -t tanxinzheng/nginx /Users/jeng/tanxinzheng-repo/docker-repo/docker-image-demo/docker-nginx
```

## 启动服务
```docker
docker run -d --name nginx -p 1080:80 tanxinzheng/nginx
```

## 从主机传输文件到指定容器目录
```
docker cp /xxxx.txt 容器名称或容器ID:/xxx/target
docker cp ./download/spark-2.4.0-bin-hadoop2.6.tgz local-download:/usr/share/nginx/html/download/
```