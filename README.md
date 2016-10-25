# Installation instructions #

These install instructions only cover config file installation;
they presume that the leverage api and frontend projects have
already been cloned into /usr/local/src, and does not cover
app dependency installation.

Furthermore, these instructions do not cover deployment of
the leverage frontend static files to /usr/local/www

## Install dependencies ##

### Ubntu 14.04 ###

- nginx
- nodejs >= 6
- sqlite3

## Pull down config repository ##

Clone this repository into /usr/local/etc or your non-system directory of preference.
The destiation this repository is cloned to is henceforth referred to as $CONFDIR

## Link files to system locations ##

### Ubuntu 14.04 ###

- nginx/leverage-jam-stack -> /etc/nginx/sites-enabled/leverage-jam-stack
- init/leverage-api.conf -> /etc/init/leverage-api.conf

## Start services ##

### Ubuntu 14.04 ###

- nginx: `service nginx start`
- uwsgi: `start leverage-api`
