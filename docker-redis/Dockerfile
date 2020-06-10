FROM centos:7
MAINTAINER tanxinzheng <tanxinzheng@139.com>

# 安装系统工具
RUN yum update -y
RUN yum upgrade -y
RUN yum install -y wget net-tools iputils-ping
RUN yum clean all

RUN mkdir /var/tmp/download

# 安装 redis
RUN mkdir /usr/local/redis
COPY ./config/redis-5.0.5.tar.gz /var/tmp/
#RUN tar xzf /var/tmp/download/redis-5.0.5.tar.gz -C /usr/local/redis
#RUN rm -rf /var/tmp/download/redis-5.0.5.tar.gz