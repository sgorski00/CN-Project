FROM php:8.2-fpm

RUN apt-get update && apt-get install -y \
    git \
    unzip \
    zip \
    libpq-dev \
    libonig-dev \
    libcurl4-gnutls-dev \
    libxml2-dev \
    && docker-php-ext-install pdo pdo_mysql bcmath mbstring xml

RUN pecl install redis \
    && docker-php-ext-enable redis

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www

COPY .env.example .env
COPY . .

ENTRYPOINT ["environment/dev/php/entrypoint.sh"]
CMD ["php-fpm"]
