FROM php:7.0-apache

#Update stretch repositories
RUN sed -i s/deb.debian.org/archive.debian.org/g /etc/apt/sources.list
RUN sed -i 's|security.debian.org|archive.debian.org/|g' /etc/apt/sources.list
RUN sed -i '/stretch-updates/d' /etc/apt/sources.list

RUN apt-get update -y && apt-get install -y curl sendmail \
 libpng-dev libmcrypt-dev libedit-dev libreadline-dev libicu-dev  \
 libldap2-dev libldb-dev libxml2-dev  && apt-get clean -y

RUN apt-get update && \
    apt-get install -y \
        zlib1g-dev 

RUN docker-php-ext-install xml
RUN docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/
RUN docker-php-ext-install ldap
RUN docker-php-ext-configure intl 
RUN docker-php-ext-install intl 
RUN docker-php-ext-install opcache
RUN docker-php-ext-install readline
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install mbstring
RUN docker-php-ext-install gd
RUN docker-php-ext-install json
RUN docker-php-ext-install mcrypt

#Update apache config
#RUN sed -i s/ServerName/ServerNamexxxx/g /etc/apache2/sites-available/000-default.conf
#RUN sed -i s/VirtualHost *:80/VirtualHost *:$PORTA/g /etc/apache2/sites-available/000-default.conf

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
	
RUN a2enmod rewrite
#RUN cp /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/ 
