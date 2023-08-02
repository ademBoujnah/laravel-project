FROM composer:latest
 
RUN addgroup -g 1000 laravel && adduser -G laravel -g laravel -s /bin/sh -D laravel

RUN chmod -R 755 /var/www/html/storage

USER laravel 

WORKDIR /var/www/html

COPY ../src .

ENTRYPOINT [ "composer", "install" ,"--ignore-platform-reqs" ]
