FROM php:8.1-fpm

RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
RUN apt-get install -y nodejs

RUN apt-get update && apt-get install -y \
    libzip-dev \
    unzip \
    && docker-php-ext-install pdo_mysql zip

RUN apt-get install -y --no-install-recommends \
    curl \
    git \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer


WORKDIR /var/www

# Copy the Laravel application files
# COPY admin /var/www/admin
# COPY cashier /var/www/cashier

# Expose port
EXPOSE 9000
# composer create-project --prefer-dist laravel/laravel .
# Start PHP-FPM server
CMD ["php-fpm"]