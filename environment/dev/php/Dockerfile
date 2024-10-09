FROM composer:2.4.4 AS composer

WORKDIR /composer
COPY . .

ENV COMPOSER_ALLOW_SUPERUSER=1
RUN composer install --no-dev --optimize-autoloader

FROM php:8.1-fpm-alpine

WORKDIR /cn-project
COPY --from=composer /composer .

RUN apk update && apk --no-cache add \
    zip \
    unzip \
    git \
    libzip-dev \
    libpng-dev \
    oniguruma-dev \
    libxml2-dev \
    gcc \
    g++ \
    make \
    && docker-php-ext-configure zip \
    && docker-php-ext-install \
    zip \
    pdo \
    pdo_mysql \
    mbstring \
    bcmath \
    gd

RUN rm -rf /var/cache/apk/* /tmp/*
