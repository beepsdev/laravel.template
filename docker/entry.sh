#!/bin/bash

# Create log files
touch /app/logs/nginx.access.log
touch /app/logs/nginx.error.log
touch /app/logs/php.error.log

# Set up composer
composer global require laravel/installer

cd /app
if [ ! -d "/app/src" ]; then
  ~/.composer/vendor/bin/laravel new ./src
  chmod -R 777 /app/src/storage
  chmod -R 777 /app/src/bootstrap/cache
fi

composer install --working-dir=/app/src

# php listen
php-fpm