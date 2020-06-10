# 基于Docker搭建FastDFS分布式存储服务

## 创建镜像
```docker
docker build -t tanxinzheng/fastdfs /Users/jeng/tanxinzheng-repo/docker-repo/docker-image-demo/docker-fastdfs
```

## 安装Docker服务
```docker

docker pull morunchang/fastdfs

docker run -d --name fdfs \
    -p 23000:23000 \
    -p 22122:22122 \
    -p 20888:8888 \
    -p 20808:8080 \
    -v /Users/jeng/tanxinzheng-repo/docker-repo/docker-image-data/docker-fastdfs/data:/data/fastdfs_data \
    -e TRACKER_IP=192.168.1.102:22122 \
    -e GROUP_NAME=group1 \
    morunchang/fastdfs sh -c "sh tracker.sh && sh storage.sh"

docker run -d --name storage -e TRACKER_IP=192.168.232.1:22122 \
    -e GROUP_NAME=group1 morunchang/fastdfs sh storage.sh
```
## 启动Docker服务
```docker
docker stop fdfs && docker rm fdfs
```

## Mac下运行fastdfs服务
```docker
# 启动 tracker
/usr/bin/fdfs_trackerd /Users/jeng/tanxinzheng-repo/docker-repo/docker-image-demo/docker-fastdfs/lib/fastdfs/conf/tracker.conf
# 启动 storage
/usr/bin/fdfs_storaged /Users/jeng/tanxinzheng-repo/docker-repo/docker-image-demo/docker-fastdfs/lib/fastdfs/conf/storage.conf
# 测试
/usr/bin/fdfs_upload_file /Users/jeng/tanxinzheng-repo/docker-repo/docker-image-demo/docker-fastdfs/lib/fastdfs/conf/client.conf test.txt
```

## 常用命令
```docker
docker exec -it fdfs /bin/bash

检查tracker，storage是否联通
/usr/bin/fdfs_monitor /etc/fdfs/storage.conf
/etc/init.d/fdfs_trackerd restart

netstat -unltp|grep fdfs
lsof -i tcp:22122

/usr/bin/fdfs_upload_file /etc/fdfs/client.conf test.txt

```

## 常见问题
- mac电脑无法ping通容器内ip，导致客户端连接超时，但是容器内使用client可以上传成功
```docker
2018-07-22 19:20:07.135  [main] ERROR  c.x.f.fss.adapters.FileStoreServiceByFastDFS - FastDFS Client Init Fail!
java.net.SocketTimeoutException: connect timed out
	at java.net.PlainSocketImpl.socketConnect(Native Method)
	at java.net.AbstractPlainSocketImpl.doConnect(AbstractPlainSocketImpl.java:345)
	at java.net.AbstractPlainSocketImpl.connectToAddress(AbstractPlainSocketImpl.java:206)
	at java.net.AbstractPlainSocketImpl.connect(AbstractPlainSocketImpl.java:188)
	at java.net.SocksSocketImpl.connect(SocksSocketImpl.java:392)
	at java.net.Socket.connect(Socket.java:589)
	at org.csource.fastdfs.ClientGlobal.getSocket(ClientGlobal.java:208)
	at org.csource.fastdfs.StorageServer.<init>(StorageServer.java:43)
	at org.csource.fastdfs.TrackerClient.getStoreStorage(TrackerClient.java:144)
	at org.csource.fastdfs.TrackerClient.getStoreStorage(TrackerClient.java:68)
	at com.xmomen.framework.fss.adapters.FileStoreServiceByFastDFS.<clinit>(FileStoreServiceByFastDFS.java:35)
	at com.xmomen.framework.fss.adapters.FileStoreServiceByFastDFSTest.setUp(FileStoreServiceByFastDFSTest.java:25)
	.....
```
- 找不到常用命令
```docker
apt-get update && apt-get install -y net-tools iputils-ping lsof
```
- 通过命令行上传文件时出现错误：tracker_query_storage_fail,error no:28, error info No space left on device
```docker
/etc/fdfs/tracker.conf
原因：tracker.conf的配置项 reserved_storage_space 的值默认为10%，而当前环境下剩余空间已不足10%。
解决：根据实际空间情况修改配置项reserved_storage_space的值。
```
group1/M00/00/00/rBEAA1tTaCCAeEm8AAAAB54_9hk841.txt

## 参考文献
- [使用Docker安装FastDFS](https://blog.csdn.net/lizhihaooo/article/details/79261388)
- [docker创建单机版的fastdfs](https://blog.csdn.net/kingdz618/article/details/76576615)
- [使用Spring Boot集成FastDFS](https://blog.csdn.net/ityouknow/article/details/79078175)
- [fastdfs的一些常见错误](https://blog.csdn.net/u010982856/article/details/51858687)
- [持续集成docker—第九篇安装FastDFS](https://blog.csdn.net/liuweilong07/article/details/80467064)