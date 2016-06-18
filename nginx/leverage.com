# Symlink this file into /etc/nginx/sites-enabled on Ubuntu 14.04

server
{
    listen 80;
    server_name www.leverage.com;
    return 301 http://leverage.com$request_uri;
}

server
{

    listen 80;
    server_name leverage.com;

    access_log /var/www/Leverage/logs/access.log;
    error_log /var/www/Leverage/logs/error.log;

    location /
    {
        root /var/www/Leverage/leverage/app/templates/app;
        index index.html;
    }

    location /static/
    {
        alias /var/www/leverage.com/static/;
    }
}
