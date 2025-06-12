FROM       php:8.2-apache
MAINTAINER layfolk
ENV        APACHE_DOCUMENT_ROOT  /var/www/html/www
RUN        sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' \
           /etc/apache2/sites-available/*.conf && \
           sed -ri -e 's!/[a-z]+.debian.org!/mirrors.tuna.tsinghua.edu.cn!g' \
           /etc/apt/sources.list.d/debian.sources && apt update && \
           apt install -y --no-install-recommends libpng-dev libjpeg-dev \
           libfreetype6-dev libc-client-dev libkrb5-dev libicu-dev libzip-dev && \
           apt autoremove -y --purge && \
           rm -rf /var/cache/apk/* && rm -rf /var/lib/apt/lists/* && \
           a2enmod rewrite remoteip && \
           pecl install apcu && \
           docker-php-ext-enable apcu && \
           docker-php-ext-configure gd --with-jpeg=/usr/include \
           --with-freetype=/usr/include/freetype2 && \
           docker-php-ext-configure imap --with-kerberos --with-imap-ssl && \
           docker-php-ext-install -j$(nproc) gd zip pdo_mysql mysqli imap intl opcache bcmath
