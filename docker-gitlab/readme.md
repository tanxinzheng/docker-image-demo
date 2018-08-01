
Docker Gitlab 安装教程

## 下载gitlab容器
```
sudo docker pull sameersbn/gitlab:latest
sudo docker pull sameersbn/postgresql:9.5-3
sudo docker pull sameersbn/redis:latest
```

## 启动postgresql
```docker
docker run --name gitlab-postgresql -d \
--env 'DB_NAME=gitlabhq_production' \
--env 'DB_USER=gitlab' --env 'DB_PASS=123456' \
--env 'DB_EXTENSION=pg_trgm' \
--volume /Users/jeng/xmomen-repo/docker/docker-image-demo/docker-gitlab/data/postgresql:/var/lib/postgresql \
sameersbn/postgresql:9.5-3
```

## 启动redis
```docker
docker run --name gitlab-redis -d \
--volume /Users/jeng/xmomen-repo/docker/docker-image-demo/docker-gitlab/data/redis:/var/lib/redis \
sameersbn/redis:latest
```

## 启动gitlab
```docker
docker run --name gitlab -d \
--link gitlab-postgresql:postgresql --link gitlab-redis:redisio \
--publish 10022:22 --publish 10080:80 \
--env 'GITLAB_PORT=10080' --env 'GITLAB_SSH_PORT=10022' \
--env 'GITLAB_SECRETS_DB_KEY_BASE=long-and-random-alpha-numeric-string' \
--env 'GITLAB_SECRETS_SECRET_KEY_BASE=long-and-random-alpha-numeric-string' \
--env 'GITLAB_SECRETS_OTP_KEY_BASE=long-and-random-alpha-numeric-string' \
--volume /Users/jeng/xmomen-repo/docker/docker-image-demo/docker-gitlab/data/gitlab:/home/git/data \
sameersbn/gitlab:latest
```

## 启动gitlab-runner
```docker
docker run --name gitlab-ci-runner -it --rm \
  -v /Users/jeng/xmomen-repo/docker/docker-image-demo/docker-gitlab/gitlab-runner/data:/home/gitlab_ci_runner/data \
  sameersbn/gitlab-ci-runner:latest
```

```docker
docker run --rm -t -i -v /Users/jeng/xmomen-repo/docker/docker-image-demo/docker-gitlab/gitlab-runner/config:/etc/gitlab-runner --name gitlab-runner gitlab/gitlab-runner register \
  --url "http://127.0.0.1:10080/" \
  --registration-token "JEDdssixUgG9G-y_wYgo" \
  --description "docker-runner" \
  --locked="false"
```

## 访问地址
http://localhost:10080/

## 配置gitlab（可选）
官方文档：https://docs.gitlab.com/omnibus/settings/configuration.html

## 更新Gitlab
注：更新Gitlab版本，首先需要停止并删除当前的Gitlab实例，请确保数据已备份。
```
sudo docker stop gitlab
sudo docker rm gitlab
```

## 修改管理员默认密码
