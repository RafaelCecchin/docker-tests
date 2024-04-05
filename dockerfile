FROM php:8.1-cli

WORKDIR /var/www

RUN apt-get update && \
    apt-get install zip -y

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php && \
    php -r "unlink('composer-setup.php');"

RUN php composer.phar create-project laravel/laravel:^8.0 example-app

ENTRYPOINT [ "php", "example-app/artisan", "serve" ]
CMD [ "--host=0.0.0.0" ]