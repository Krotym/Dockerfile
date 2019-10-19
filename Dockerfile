
FROM ubuntu:16.04


RUN apt-get -y update
RUN apt-get -y install apache2
RUN apt-get -y install git
RUN apt-get -y install nano


RUN cd /var/www/html &&\
 rm index.html && \
 git clone https://github.com/Krotym/test.git .

CMD ["/usr/sbin/apache2ctl","-DFOREGROUND"]
EXPOSE 80
