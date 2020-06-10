FROM centos:centos7

MAINTAINER Tanxinzheng <tanxinzheng@139.com>

# 安装系统工具
RUN yum update -y
RUN yum upgrade -y
RUN yum install -y wget net-tools
RUN yum clean all

ENV DOWNLOAD_SITE http://192.168.1.108:1080/download

# 安装Java
RUN mkdir /usr/local/jdk
RUN wget -P /var/tmp/download \
	$DOWNLOAD_SITE/jdk-8u141-linux-x64.tar.gz
RUN tar xzf /var/tmp/download/jdk-8u141-linux-x64.tar.gz -C /usr/local/jdk
RUN rm -rf /var/tmp/download/jdk-8u141-linux-x64.tar.gz


# 设置Java环境变量
ENV JAVA_VERSION jdk1.8.0_141
ENV JAVA_HOME /usr/local/jdk/jdk1.8.0_141
ENV JRE_HOME /usr/local/jdk/jdk1.8.0_141/jre
ENV CLASS_PATH .:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JRE_HOME/lib
ENV PATH $PATH:$JAVA_HOME/bin:$JRE_HOME/bin


RUN yum install -y openssh-server
RUN yum install -y openssh-clients

# 解决启动sshd时，遇到的：sshd: no hostkeys available — exiting
RUN ssh-keygen -q -t rsa -b 2048 -f /etc/ssh/ssh_host_rsa_key -N '' 
RUN ssh-keygen -q -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N ''
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_ed25519_key -N '' 
RUN sed -i "s/#UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config
RUN chmod 755 /etc/ssh/sshd_config

# Install gosu username
RUN gpg --keyserver pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
    && curl -o /usr/local/bin/gosu -SL "https://github.com/tianon/gosu/releases/download/1.2/gosu-amd64" \
    && curl -o /usr/local/bin/gosu.asc -SL "https://github.com/tianon/gosu/releases/download/1.2/gosu-amd64.asc" \
    && gpg --verify /usr/local/bin/gosu.asc \
    && rm /usr/local/bin/gosu.asc \
    && rm -r /root/.gnupg/ \
    && chmod +x /usr/local/bin/gosu

# 安装hadoop
#RUN useradd hadoop

WORKDIR /spark
RUN wget -P /var/tmp/download \
	$DOWNLOAD_SITE/hadoop-3.2.0.tar.gz
RUN tar xzf /var/tmp/download/hadoop-3.2.0.tar.gz -C /spark
RUN rm -rf /var/tmp/download/hadoop-3.2.0.tar.gz
COPY ./config/core-site.xml /spark/hadoop-3.2.0/etc/hadoop/core-site.xml
COPY ./config/hdfs-site.xml /spark/hadoop-3.2.0/etc/hadoop/hdfs-site.xml
COPY ./config/mapre-site.xml /spark/hadoop-3.2.0/etc/hadoop/mapre-site.xml
COPY ./config/yarn-site.xml /spark/hadoop-3.2.0/etc/hadoop/yarn-site.xml
COPY ./config/hadoop-env.sh /spark/hadoop-3.2.0/etc/hadoop/hadoop-env.sh
COPY ./config/start-dfs.sh /spark/hadoop-3.2.0/sbin/start-dfs.sh
COPY ./config/stop-dfs.sh /spark/hadoop-3.2.0/sbin/stop-dfs.sh
COPY ./config/start-yarn.sh /spark/hadoop-3.2.0/sbin/start-yarn.sh
COPY ./config/stop-yarn.sh /spark/hadoop-3.2.0/sbin/stop-yarn.sh
ENV PATH $HADOOP_HOME/bin:$PATH
ENV PATH $HADOOP_HOME/sbin:$PATH
#RUN chown hadoop:hadoop -R /spark/hadoop-3.2.0

#USER hadoop
RUN /usr/bin/ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
RUN cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
RUN chmod 600 ~/.ssh/authorized_keys

#USER root

# 安装spark
#WORKDIR /spark
#ENV SPARK_HOME /spark/spark-2.4.0-bin-hadoop2.6
#ENV SPARK_ZIP spark-2.4.0-bin-hadoop2.6.tgz
#RUN wget -P /var/tmp/download \
#	$DOWNLOAD_SITE/$SPARK_ZIP
#RUN tar zxvf /var/tmp/download/$SPARK_ZIP -C /spark
#
#RUN rm -rf /var/tmp/download/$SPARK_ZIP
#
#ENV PATH $SPARK_HOME/bin:$PATH
#ENV PATH $SPARK_HOME/sbin:$PATH

# 50070 hdfs
# 8088  hadoop
# 8080 	spark master ui
# 8081  spark worker ui

COPY ./config/entrypoint.sh /
RUN chmod 777 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 8088 50070 9870