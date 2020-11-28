FROM php:7.3-apache

WORKDIR /var/www/html

RUN apt-get update

RUN set -x \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug

RUN set -x  && \
    apt-get install -y libpng-dev libxml2-dev libzip-dev && \
    docker-php-ext-install gd && \
    docker-php-ext-install soap && \
    docker-php-ext-install sockets && \
    docker-php-ext-install zip

RUN pecl install -o -f redis \
    &&  rm -rf /tmp/pear \
    &&  docker-php-ext-enable redis

RUN set -x  && \
    docker-php-ext-install mysqli

RUN docker-php-ext-install pdo pdo_mysql

RUN apt-get install -y less nano \
    net-tools \
    dnsutils

# apache2 conf
COPY conf-available/02-dev.conf /etc/apache2/conf-available/02-dev.conf
RUN a2enconf 02-dev.conf

# apache2 vhosts, modes
RUN mkdir -p /var/www/html/public && mkdir -p /var/www/html/crm
COPY sites-available /etc/apache2/sites-available
RUN set -x && ls -la /etc/apache2/sites-available
RUN a2enmod rewrite
RUN a2dissite 000-default.conf && \
    a2ensite 00-system-2.conf && \
    a2ensite 00-system-1.conf
RUN set -x && apache2ctl -t
RUN service apache2 restart

EXPOSE 8180 8280

RUN useradd --user-group --create-home --shell /bin/bash app

RUN touch /var/log/xdebug.log && chmod 0777 /var/log/xdebug.log

# link web:
COPY entrypoint.sh /docker-entrypoint.d/my-entrypoint.sh
RUN chmod +x /docker-entrypoint.d/my-entrypoint.sh
CMD set -x && /docker-entrypoint.d/my-entrypoint.sh

# USER app      # why this fails?

WORKDIR /var/www/html
