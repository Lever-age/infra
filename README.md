# Leverage application deployment guide #

## Dependencies ##

### Install dependencies ###

- git
- rsync

### Runtime dependencies ###

- nginx
- nodejs >= 6
- sqlite3

## Pull down infra repository ##

Clone this repository to a `$REPODIR` of your choice.

If you would like `$REPODIR` to be /usr/local, you will
not be able to pull down the repository using `git-clone`
since /usr/local is not an empty directory. To deploy using
/usr/local as the `$REPODIR`, employ the following procedure
instead:

```
REPODIR=/usr/local
cd $REPODIR
git init
git remote add origin git@github.com:Lever-age/infra.git
git fetch origin master
git checkout -t origin/master
```

## Install application ##

``
git clone https://github.com/Lever-age/frontend.git /usr/local/src/frontend
git clone https://github.com/Lever-age/api.git /usr/local/src/api
( cd /usr/local/src/api && npm install )
mkdir /usr/local/www
$REPODIR/bin/deploy-frontend.sh
``

## Populate database ##

The API configuration held in this repository assumes a sqlite database
will exist with populated data at a particular filesystem location. This
location is configured in api/config.json.

The population of a production grade database is outside the scope of this
deployment guide, but a test database can be easily generated from within
the api project by running `npm run test-data`. The generated test database
will be placed in the api project directory at test/data/db.sqlite, and may
be moved from there to the desired filesystem location.

## Link config files to system locations ##

### Ubuntu 14.04 ###

- nginx/leverage-jam-stack -> /etc/nginx/sites-enabled/leverage-jam-stack
- init/leverage-api.conf -> /etc/init/leverage-api.conf

## Start services ##

### Ubuntu 14.04 ###

- nginx: `service nginx start`
- api: `start leverage-api`
