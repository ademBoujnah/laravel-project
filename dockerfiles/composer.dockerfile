FROM composer:latest
 
RUN addgroup -g 1000 laravel && adduser -G laravel -g laravel -s /bin/sh -D laravel

RUN chmod o+w ./storage/ -R

USER laravel 

WORKDIR /var/www/html

COPY ../src .

ENTRYPOINT [ "composer", "install" ,"--ignore-platform-reqs" ]
