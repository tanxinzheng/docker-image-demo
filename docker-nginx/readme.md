# 基于Docker搭建Nginx服务

## 创建镜像
```docker
docker build -t tanxinzheng/nginx /Users/jeng/xmomen-repo/docker/docker-image-demo/docker-nginx
```

## 启动服务
```docker
docker run -d --name nginx -p 80:80 tanxinzheng/nginx
```