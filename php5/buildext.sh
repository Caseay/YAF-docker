#!/bin/sh

apk add --update \
    php5 \
    php5-dev \
    zlib-dev \
    libmemcached-dev \
    cyrus-sasl-dev \
    curl \
    autoconf \
    g++ \
    make;

BUILD(){ \
    curl -#SL https://pecl.php.net/get/$1.tgz | tar zx -C "/tmp/" && \
    cd "/tmp/$1" && \
    phpize && \
    ./configure --with-php-config=php-config5 && \
    make && make \
    cp /tmp/$1/modules/*.so /run/modules/; \
};

BUILD redis-3.1.1
BUILD yaf-2.3.5
BUILD memcached-2.2.0

