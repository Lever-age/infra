server {

listen 80;
server_name www.leverage.com;
rewrite ^/(.*) http://leverage.com/$1 permanent;
}

server {

listen 80;
server_name leverage.com;

access_log /var/www/Leverage/logs/access.log;
error_log /var/www/Leverage/logs/error.log;

location / {

root /var/www/Leverage/leverage/app/templates/app;
index index.html;
}
}
