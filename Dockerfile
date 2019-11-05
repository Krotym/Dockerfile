FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y \
        php7.0 \
        php7.0-cgi \
        php7.0-cli \
        php7.0-common \
        php7.0-curl \
        php7.0-dev \
        php7.0-enchant \
        php7.0-interbase \
        php7.0-intl \
        php7.0-json \
        php7.0-ldap \
        php7.0-mysql \
        php7.0-odbc \
        php7.0-opcache \
        php7.0-pgsql \
        php7.0-phpdbg \
        php7.0-readline \
        php7.0-snmp \
        php7.0-sqlite3 \
        php7.0-sybase \
        php7.0-xmlrpc \
        php7.0-xsl
RUN apt-get install apache2 libapache2-mod-php7.0 -y
RUN apt-get install mariadb-server  -y
RUN apt-get install git  nano tree curl  -y


RUN cd /var/www/html &&\
 rm index.html && \
 git clone https://github.com/Krotym/test.git .

COPY run-lamp.sh /usr/sbin/
COPY ms.sh /usr/sbin/
RUN  chmod 777 /usr/sbin/ms.sh
RUN  cd /var/run  &&\ls -al

RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN chmod +x /usr/sbin/run-lamp.sh

EXPOSE 80
EXPOSE 3306

CMD ["/usr/sbin/run-lamp.sh"]

