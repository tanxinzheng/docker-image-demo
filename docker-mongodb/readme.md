# MongoDB

## 源码下载
http://downloads.mongodb.org/linux/mongodb-linux-x86_64-rhel70-4.0.4.tgz

## stack.yml
```
version: '3.1'

services:
  mongo:
    image: mongo
    restart: always
    environment:
      MONGO_INITDB_ROOT_USERNAME: root
      MONGO_INITDB_ROOT_PASSWORD: root

  mongo-express:
    image: mongo-express
    restart: always
    ports:
      - 8081:8081
    environment:
      ME_CONFIG_MONGODB_ADMINUSERNAME: root
      ME_CONFIG_MONGODB_ADMINPASSWORD: root
```

## 启动
```
docker stack deploy -c stack.yml mongo
// OR
docker-compose -f stack.yml up
```