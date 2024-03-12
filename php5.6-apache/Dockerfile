FROM php:5.6-apache

#Update stretch repositories
RUN sed -i s/deb.debian.org/archive.debian.org/g /etc/apt/sources.list
RUN sed -i 's|security.debian.org|archive.debian.org/|g' /etc/apt/sources.list
RUN sed -i '/stretch-updates/d' /etc/apt/sources.list

RUN apt-get update -y && apt-get install -y sendmail libpng-dev libmcrypt-dev libedit-dev libreadline-dev libldap2-dev libldb-dev

RUN apt-get update && \
    apt-get install -y \
        zlib1g-dev 

RUN docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/
RUN docker-php-ext-install ldap
RUN docker-php-ext-install readline
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install mysql mysqli
RUN docker-php-ext-install mbstring
RUN docker-php-ext-install gd
RUN docker-php-ext-install json
RUN docker-php-ext-install mcrypt

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
#RUN echo "extension=pdo.so" >> /usr/local/etc/php/conf.d/php-ext-pdo.ini
#RUN echo "extension=pdo_mysql.so" >> /usr/local/etc/php/conf.d/php-ext-pdo-mysql.ini

RUN a2enmod rewrite
RUN a2enmod remoteip
RUN a2enmod headers

