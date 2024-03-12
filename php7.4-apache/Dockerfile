FROM php:7.4-apache

RUN apt-get update -y && apt-get install -y curl sendmail \
 libpng-dev libmcrypt-dev libedit-dev libreadline-dev libicu-dev  \
 libldap2-dev libldb-dev libxml2-dev  && apt-get clean -y

RUN apt-get update && \
    apt-get install -y \
        zlib1g-dev 

RUN docker-php-ext-install pdo_mysql

RUN pecl install mcrypt-1.0.5
RUN docker-php-ext-enable mcrypt

RUN docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/
RUN docker-php-ext-install ldap
RUN docker-php-ext-configure intl 
RUN docker-php-ext-install intl 
RUN docker-php-ext-install opcache
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install gd

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
	
RUN a2enmod rewrite
