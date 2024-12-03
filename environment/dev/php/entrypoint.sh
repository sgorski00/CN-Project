#!/bin/bash

if [ ! -f .env ]; then
    cp .env.example .env
fi

if [ ! -d "vendor" ]; then
    composer install --no-dev --no-interaction --optimize-autoloader
fi

php artisan key:generate --force
php artisan migrate --force

exec php-fpm
