FROM tomcat:latest-alpine
# MAINTAINER tanxinzheng <tanxinzheng@139.com>
# ENV REFRESHED_AT 2017-7-28

RUN apt-get -yqq update
RUN apt-get -yqq install tomcat7 default-jdk
RUN apt-get install openssh-server

ENV CATALINA_HOME /usr/share/tomcat7
ENV CATALINA_BASE /var/lib/tomcat7
ENV CATALINA_PID  /var/run/tomcat7.pid
ENV CATALINA_SH   /usr/share/tomcat7/bin/catalina.sh
ENV CATALINA_TMPDIR /tmp/tomcat7-tomcat7-tmp

RUN mkdir -p $CATALINA_TMPDIR

VOLUME ["/var/lib/tomcat7/webapps/"]

EXPOSE 8080
spark-shell


ENTRYPOINT ["/usr/share/tomcat7/bin/catalina.sh", "run" ]