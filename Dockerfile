FROM php:8.0-apache

RUN apt update -y
RUN apt upgrade -y

RUN docker-php-ext-install mysqli pdo pdo_mysql

COPY ./Application/* /var/www/html/
