FROM ubuntu:18.10
MAINTAINER tanxinzheng <tanxinzheng@139.com>

ENV DOWNLOAD_SITE http://192.168.1.108:1080/download

# 安装系统工具
#RUN apt update -y
#RUN yum upgrade -y
#RUN yum install -y wget net-tools iputils-ping
#RUN yum clean all

RUN mkdir /var/tmp/download
RUN mkdir /apache/data
RUN ln -s /apache/data /data
RUN apt install -y openjdk-8-jre-headless
RUN apt install -y postgresql-10
RUN apt install -y mysql-server-5.7
RUN apt install -y nodejs
RUN apt install -y npm
RUN node -v
RUN npm -v

RUN createdb -O admin quartz
RUN psql -p <port> -h <host address> -U <username> -f Init_quartz_postgres.sql quartz

#COPY ./docker-entrypoint.sh /usr/local/bin/
#RUN ln -s usr/local/bin/docker-entrypoint.sh /entrypoint.sh

#ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["/bin/bash"]