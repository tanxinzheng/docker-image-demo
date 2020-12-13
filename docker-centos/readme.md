
### build centos7 container

```
docker build -t tanxz/centos7 .
docker run txz/centos7 /bash
```

```
FROM centos:7
MAINTAINER tanxinzheng <tanxinzheng@139.com>

ENV DOWNLOAD_SITE http://http://172.31.137.92:1080/download

# 安装系统工具
RUN yum update -y
RUN yum upgrade -y
RUN yum install -y byobu curl htop man unzip nano wget net-tools iputils-ping
RUN yum clean all

RUN mkdir /var/tmp/download
# 安装Java
RUN mkdir /usr/local/jdk
RUN wget -P /var/tmp/download \
	$DOWNLOAD_SITE/jdk-8u141-linux-x64.tar.gz
#RUN wget -P /var/tmp/download \
#	--no-cookies --no-check-certificate \
#	--header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \
#	"http://download.oracle.com/otn-pub/java/jdk/8u141-b15/336fa29ff2bb4ef291e347e091f7f4a7/jdk-8u141-linux-x64.tar.gz"
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

# 安装Maven
RUN mkdir /usr/local/maven
RUN wget -P /var/tmp/download \
	$DOWNLOAD_SITE/apache-maven-3.5.0-bin.tar.gz
#RUN wget -P /var/tmp/download https://archive.apache.org/dist/maven/maven-3/3.5.0/binaries/apache-maven-3.5.0-bin.tar.gz 
RUN tar zxvf /var/tmp/download/apache-maven-3.5.0-bin.tar.gz -C /usr/local/maven
RUN rm -rf /var/tmp/download/apache-maven-3.5.0-bin.tar.gz
# 设置Maven环境变量
ENV M2_HOME /usr/local/maven/apache-maven-3.5.0
ENV PATH $PATH:$M2_HOME/bin

# 安装Git
RUN yum install -y make expat-devel gettext-devel openssl-devel zlib-devel gcc perl-ExtUtils-MakeMaker
RUN mkdir /usr/local/git
RUN wget -P /var/tmp/download \
	$DOWNLOAD_SITE/git-2.8.3.tar.gz
#RUN wget -P /var/tmp/download https://www.kernel.org/pub/software/scm/git/git-2.8.3.tar.gz --no-check-certificate
RUN tar zxvf /var/tmp/download/git-2.8.3.tar.gz -C /usr/local/git
RUN cd /usr/local/git/git-2.8.3 \
	&& ./configure prefix=/usr/local/git/git-2.8.3 \
	&& make && make install
RUN rm -rf /var/tmp/download/git-2.8.3.tar.gz
RUN yum remove -y make expat-devel gettext-devel openssl-devel zlib-devel gcc perl-ExtUtils-MakeMaker
# 设置Git环境变量
ENV GIT_HOME /usr/local/git/git-2.8.3
ENV PATH $PATH:$GIT_HOME/bin
```