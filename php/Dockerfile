FROM dunglas/frankenphp

RUN apt-get update && apt-get install -y git unzip

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN docker-php-ext-install mysqli pdo pdo_mysql

COPY Question-pour-un-piscineux-WEBSITE/ /app

RUN cd /app && composer install

EXPOSE 443
