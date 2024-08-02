FROM php:8.2-apache

RUN apt-get update && apt-get install -y git unzip libpng-dev libjpeg-dev libfreetype6-dev libicu-dev zlib1g-dev libzip-dev

RUN a2enmod rewrite

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN docker-php-ext-install mysqli pdo pdo_mysql

COPY Question-pour-un-piscineux-WEBSITE/ /var/www/html/

RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html

COPY apache-config.conf /etc/apache2/sites-available/000-default.conf

RUN cd /var/www/html/ && composer install

EXPOSE 80
