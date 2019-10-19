FROM centos:7
MAINTAINER tanxinzheng@139.com
        
#RUN ln -sf /dev/stdout /var/log/nginx/access.log
#RUN ln -sf /dev/stderr /var/log/nginx/error.log

RUN yum -y update && \
    yum -y install epel-release && \
    yum -y install nginx git logrotate && \
    yum clean all
CMD ["nginx","-g","daemon off;"]

EXPOSE 80 443