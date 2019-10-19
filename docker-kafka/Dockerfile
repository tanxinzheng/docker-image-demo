FROM centos:6
MAINTAINER tanxinzheng <tanxinzheng@139.com>

ENV DOWNLOAD_SITE http://192.168.1.108:1080/download

# 安装系统工具
RUN yum update -y
RUN yum upgrade -y
RUN yum install -y wget unzip net-tools iputils-ping
RUN yum clean all

RUN mkdir /var/tmp/download

# 安装Java
RUN mkdir /usr/local/jdk
RUN wget -P /var/tmp/download \
	$DOWNLOAD_SITE/jdk-8u141-linux-x64.tar.gz
RUN tar xzf /var/tmp/download/jdk-8u141-linux-x64.tar.gz -C /usr/local/jdk
RUN rm -rf /var/tmp/download/jdk-8u141-linux-x64.tar.gz
# 设置Java环境变量
ENV JAVA_HOME /usr/local/jdk/jdk1.8.0_141
ENV JRE_HOME /usr/local/jdk/jdk1.8.0_141/jre
ENV CLASS_PATH .:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JRE_HOME/lib
ENV PATH $PATH:$JAVA_HOME/bin:$JRE_HOME/bin
ENV JAVA_VERSION jdk1.8.0_141
ENV JAVA_HOME /usr/local/jdk/jdk1.8.0_141
ENV PATH $PATH:$JAVA_HOME/bin

# 安装kafka
RUN mkdir /kafka
RUN wget -P /var/tmp/download \
	$DOWNLOAD_SITE/kafka_2.12-2.0.1.tgz
RUN tar xzf /var/tmp/download/kafka_2.12-2.0.1.tgz -C /kafka
RUN rm -rf /var/tmp/download/kafka_2.12-2.0.1.tgz