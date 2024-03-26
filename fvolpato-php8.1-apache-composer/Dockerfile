FROM php:8.1-apache-bullseye as production

RUN apt-get update

RUN apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    libldap-dev

RUN docker-php-ext-configure opcache --enable-opcache && \
    docker-php-ext-install pdo pdo_mysql mbstring exif pcntl bcmath gd

RUN docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/
RUN docker-php-ext-install ldap

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

COPY ./servicos/ifaccess/app/ /var/www/html

WORKDIR /var/www/html

RUN composer install --prefer-dist --no-dev --optimize-autoloader --no-interaction

RUN chmod 775 -R /var/www/html/
RUN chmod 775 -R /var/www/html/storage/
RUN chmod 775 -R /var/www/html/bootstrap/cache
RUN chown -R www-data:www-data /var/www/

RUN php artisan key:generate --force
    
RUN php artisan clear-compiled && \
    php artisan config:cache && \
    php artisan route:cache && \
    php artisan storage:link && \
    php artisan config:clear && \
    a2enmod rewrite && \
    service apache2 restart

