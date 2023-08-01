FROM nginx:stable-alpine
 
WORKDIR /etc/nginx/conf.d
 
#COPY ../nginx/nginx.conf .
 
#RUN mv nginx.conf default.conf

WORKDIR /var/www/html
 
COPY src .

ENTRYPOINT ["cat", "/etc/nginx/conf.d/nginx.conf']
