FROM php:7.4-apache-buster
#Install git
RUN apt-get update \
    && apt-get install -y git \
    && docker-php-ext-install pdo pdo_mysql mysqli \
    && a2enmod rewrite \
    && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --install-dir=. --filename=composer \
    && mv composer /usr/local/bin/
    
EXPOSE 80