FROM composer:2.4.4 as composer
FROM php:8.1.0-fpm as php

COPY --from=composer /usr/bin/composer /usr/local/bin/composer
COPY ./environment/dev/php/php.ini /usr/local/etc/php/conf.d/php.ini


RUN apt-get update \
    && apt-get install -y libzip-dev openssl zip unzip git \
    && docker-php-ext-install zip pdo pdo_mysql \
    && docker-php-ext-configure zip

COPY . /application
WORKDIR /application

ENV COMPOSER_ALLOW_SUPERUSER=1
RUN composer install --no-dev --no-interaction
