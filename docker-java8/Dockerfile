# using alpine-glibc instead of alpine is mainly because JDK relies on glibc
FROM centos:7
# author
LABEL tanxinzheng tanxinzheng@139.com
# A streamlined jre
# ADD jre8.tar.gz /usr/local/dockerimage/smalljava8/jre8/

ADD jdk-8u141-linux-x64.tar.gz /usr/local/java

# set env
ENV JAVA_HOME /usr/local/java/jdk1.8.0_141
ENV PATH ${PATH}:${JAVA_HOME}/bin
# run container with base path:/opt
WORKDIR /opt
