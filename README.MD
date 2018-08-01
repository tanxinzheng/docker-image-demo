# Docker 教程

## Docker服务镜像列表
- [x] tomcat
- [x] mysql
- [ ] memcached
- [ ] FastDFS
- [x] redis
- [x] jenkins
- [x] gitlab
- [x] nexus3

## 镜像加速地址
http://adbcd100.m.daocloud.io

## Docker常用命令
```
查看所有容器
docker ps

Docker的安装是否正确
$ docker info

拉取一个预建的镜像
$ docker pull $docker_name

运行容器
$ docker run $docker_name

运行Docker logs命令来查看job的当前状态：
$ docker logs $sample_job

查看Docker命令说明
$ docker help

停止容器
$ docker stop $sample_job

重启容器
$ docker restart $sample_job

停止并移除容器镜像
$ docker stop $sample_job docker rm $sample_job

保存容器镜像状态
$ docker commit $sample_job job1

命令查看所有镜像的列表
$ docker images

根据镜像名称查询私有仓库镜像
$ docker search image-name

查看镜像历史版本
$ docker history image_name

将镜像推送到registry
$ docker push image_name

查看容器IP,端口
docker inspect -f='{{.Name}} {{.NetworkSettings.IPAddress}} {{.HostConfig.PortBindings}}' $(docker ps -aq)

进入容器内部
docker exec -it container_name /bin/bash

基于Dockerfile创建镜像
docker build -t tanxinzheng/image_name /Users/jeng/xmomen-repo/docker/docker-image-demo/docker-fastdfs/Dockerfile

```

## Linux常用命令
```docker
# 下载ifconfig，ping命令
apt-get update && apt-get install -y net-tools iputils-ping
```

## 参考文献
- [Dockerfile介绍](https://www.cnblogs.com/boshen-hzb/p/6400272.html)

## 常见问题
- [github访问缓慢，替换hosts文件](https://blog.csdn.net/sunsteam/article/details/63253933)
```docker
# 修改完之后执行下面的命令
sudo killall -HUP mDNSResponder
```