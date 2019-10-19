# 基于Docker搭建Tomcat服务

## 创建镜像
```docker
docker build -t tanxinzheng/tomcat /Users/jeng/tanxinzheng-repo/docker/docker-image-demo/docker-tomcat
```

## 启动Docker服务
```docker
docker run -d --name my-tomcat -p 8080:8080 tanxinzheng/tomcat
```
