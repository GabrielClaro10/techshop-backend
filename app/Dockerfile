FROM php:8.1-apache
WORKDIR /app
RUN apt-get clean && apt-get update && apt-get install -y --no-install-recommends \
    git unzip curl ca-certificates libzip-dev libonig-dev libpng-dev \
    && docker-php-ext-install zip mbstring gd \
    && a2enmod rewrite \
    && rm -rf /var/lib/apt/lists/*
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
COPY composer.json composer.lock ./
RUN composer install --no-scripts --no-autoloader --prefer-dist --optimize-autoloader
COPY . .
RUN chown -R www-data:www-data storage bootstrap/cache
RUN chmod -R 775 storage bootstrap/cache
COPY ./.docker/apache/apache.conf /etc/apache2/sites-available/000-default.conf
EXPOSE 80
CMD ["apache2-foreground"]
