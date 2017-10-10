FROM centos:7
MAINTAINER from auth <email>

RUN yum -y update
RUN yum -y instal httpd
EXPOSE 80

ADD index.html
ADD run.sh /run.sh
RUN chmod 775 /run.sh
CMD ["/run.sh"]
