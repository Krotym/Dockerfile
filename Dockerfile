
FROM ubuntu:18.04

RUN apt-get -y update
RUN apt-get -y install apache2
RUN apt-get -y install git
RUN apt-get -y install nano

RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -s /bin/true /sbin/initctl
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y install mysql-server
EXPOSE 3306
CMD ["/usr/bin/mysqld_safe"]

RUN cd /var/www/html &&\
 rm index.html && \
 git clone https://github.com/Krotym/test.git .

CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]

EXPOSE 80
