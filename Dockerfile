FROM drupal:9.5-apache

WORKDIR /var/www/html

EXPOSE 80

COPY . /var/www/html