# build docker image
```
docker build -t tanxinzheng/spark .
docker run -d -t --name spark tanxinzheng/spark
docker exec -u 0 -it spark /bin/bash
```

# 端口映射
http://192.168.1.108:28080/ [Spark管理界面，默认端口8080](http://192.168.1.108:28080/)
http://192.168.1.108:50070/ [HDFS管理界面，默认端口50070](http://192.168.1.108:50070/)