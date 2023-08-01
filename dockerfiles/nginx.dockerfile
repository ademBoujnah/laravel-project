FROM nginx:stable-alpine
 
WORKDIR /etc/nginx/conf.d
 
COPY ../nginx/default.conf .
 
#RUN mv nginx.conf default.conf

WORKDIR /var/www/html
 
COPY src .

#ENTRYPOINT ["ls", "/etc/nginx/conf.d/nginx.conf"]
