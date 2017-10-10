FROM 2588bb41a924
MAINTAINER from zzp <qq.com>

RUN yum -y update
RUN yum -y install httpd
EXPOSE 80

ADD index.html /var/www/html/index.html
ADD run.sh /run.sh
RUN chmod 775 /run.sh

CMD ["/run.sh"]