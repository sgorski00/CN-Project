FROM php:8.2

RUN apt-get update -y
RUN apt-get install -y \
    unzip \
    zip \
    git \
    libpq-dev \
    libcurl4-gnutls-dev
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
RUN docker-php-ext-install pdo pdo_mysql bcmath
RUN pecl install -o -f redis \
    && rm -rf /tmp/pear \
    && docker-php-ext-enable redis

WORKDIR /var/www
COPY . .

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

ENV PORT=8000
ENTRYPOINT [ "environment/dev/php/entrypoint.sh" ]
