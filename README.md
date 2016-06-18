# Installation instructions #

## Install dependencies ##

### Ubntu 14.04 ###

- nginx
- uwsgi
- uwsgi-plugin-python

## Pull down config repository ##

Clone this repository into /usr/local/etc or your non-system directory of preference.
The destiation this repository is cloned to is henceforth referred to as $CONFDIR

## Link files to system locations ##

### Ubuntu 14.04 ###

- nginx/leverage.com -> /etc/nginx/sites-enabled/leverage.com
- init/leverage.conf -> /etc/init/leverage.conf

## Start services ##

### Ubuntu 14.04 ###

- nginx: `service nginx start`
- uwsgi: `start leverage`
