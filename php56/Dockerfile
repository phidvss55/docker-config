FROM php:5.6-fpm

# cài đặt và kích hoạt opcache, mysqli, pdo_mysql, memcached

RUN apt-get update -y \
    && apt-get install libzip-dev zip libmemcached-dev  -y \
    && apt-get install vim -y \
    && apt-get install libmcrypt-dev -y \
    && apt-get install libpng-dev -y \
    && apt-get install apt-utils -y \
    && apt-get install htop \
    && docker-php-ext-install zip opcache mysqli pdPHPo_mysql mcrypt gd exif \
    && docker-php-ext-enable mysqli \
    && docker-php-ext-enable opcache \
    && docker-php-ext-enable pdo_mysql \
    && rm -rf /var/lib/apt/lists/*  \
    && pecl install xdebug-2.5.5\ 
    && docker-php-ext-enable xdebug

    RUN apt-get update \
	&& apt-get install -y libicu-dev \
	&& docker-php-ext-configure intl \
	&& docker-php-ext-install -j$(nproc) intl


    # math
    RUN apt-get update \
        && apt-get install -y libgmp-dev \
        && ln -s /usr/include/x86_64-linux-gnu/gmp.h /usr/include/gmp.h \
        && docker-php-ext-install -j$(nproc) \
            gmp \
            bcmath

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
#ADD ./php.ini /usr/local/etc/php/php.ini

EXPOSE 9000

# CMD [ "httpd-foreground"]
