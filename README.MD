# Docker 教程

## 基本规范

- 尽量使用同一版本的linux系统(该示例统一使用centos:7)自建基础镜像，方便添加，查看ip，查看端口，jdk环境，日志备份等基础服务

## Docker服务镜像列表
- [x] mongodb
- [x] mysql
- [x] postgresql
- [x] portainer
- [x] fastdfs
- [x] gitlab
- [x] jenkins
- [x] nexus3
- [x] nginx
- [x] redis
- [x] tomcat
- [x] elk
- [ ] spark
- [ ] registry

## 镜像加速地址
http://adbcd100.m.daocloud.io

## 网络配置

- 桥接模式
默认模式，直接使用宿主机网络


## Docker常用命令
```
查看所有容器
docker ps

Docker的安装是否正确
$ docker info

拉取一个预建的镜像
$ docker pull $docker_name

创建容器
$ docker run $docker_name

创建交互式容器
$ docker run -it $docker_name /bin/bash

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

从容器上把文件复制到主机上,是容器进程的id
docker cp 容器进程Id:/logs/temp ./

进入容器内部
docker exec -it container_name /bin/bash

// 使用root用户进入容器内部
docker exec -u 0 -it mycontainer bash

基于Dockerfile创建镜像
docker build -t tanxinzheng/image_name /User/jeng/xmomen-repo/docker/docker-image-demo/docker-fastdfs/Dockerfile
User
```

## Linux常用命令
```docker
# 下载ifconfig，ping命令
apt-get update && apt-get install -y net-tools iputils-ping
```
```
curl -X POST http://localhost:8090/job/AUTO-TEST/build \
  --user admin:123456 \
  --data-urlencode json='{"parameter": [{"name":"id", "value":"123"}, {"name":"verbosity", "value":"high"}]}'
  
  curl -X POST http://localhost:8090/job/AUTO-TEST/build \
    --user admin:123456 \
    --form json='{"parameter": [{"name":"FILE_LOCATION_AS_SET_IN_JENKINS", "file":"file0"}]}'
    
curl -X POST -H "$CRUMB" "http://admin:123456@localhost:8090/createItem?name=NewJob"

curl -X POST -u admin:123456 -H "Content-Type:application/xml" "http://localhost:8090/createItem?name=AA_TEST_JOB3"
```
## 参考文献
- [Dockerfile介绍](https://www.cnblogs.com/boshen-hzb/p/6400272.html)

## 常见问题
- [github访问缓慢，替换hosts文件](https://blog.csdn.net/sunsteam/article/details/63253933)
```docker
# 修改完之后执行下面的命令
sudo killall -HUP mDNSResponder
```
- [在docker中通过systemctl 启动服务的时候总是报Failed to get D-Bus connection: Operation not permitted 这样的错误提示。](https://blog.csdn.net/rznice/article/details/52253114)
```
添加--privileged和/usr/sbin/init
docker run --privileged -d -p 10080:80 centos /usr/sbin/init 
```