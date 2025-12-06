FROM php:7.3-fpm

# cài đặt và kích hoạt opcache, mysqli, pdo_mysql, memcached

RUN apt-get update -y \
    && apt-get install libzip-dev zip libmemcached-dev  -y \
    && apt-get install vim -y \
    && apt-get install apt-utils -y \
    && apt-get install htop \
    && apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng-dev  \
    && docker-php-ext-install zip opcache mysqli pdo_mysql \
    && docker-php-ext-enable mysqli \
    && docker-php-ext-enable opcache \
    && docker-php-ext-enable pdo_mysql \
    && pecl install memcached \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
     && pecl install xdebug-2.8.0 \ 
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

#ADD ./php.ini /usr/local/etc/php/php.ini
# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

EXPOSE 9000

# CMD [ "httpd-foreground"]
