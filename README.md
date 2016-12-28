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

```
git clone https://github.com/Lever-age/frontend.git /usr/local/src/frontend
git clone https://github.com/Lever-age/api.git /usr/local/src/api
( cd /usr/local/src/api && npm install )
mkdir /usr/local/www
$REPODIR/bin/deploy-frontend.sh
```

## Populate database ##

A sqlite3 database will need to exist at the location specified 
by `storage.path` in etc/api/config.json

### Testing database ###

```
cd /usr/local/src/api
npm run test-data
mv test/data/db.sqlite $STORAGEPATH
```

### Production database ###

The deployment and population of a production database is outside
of the scope of this deployment guide

## Link config files to system locations ##

### Ubuntu 14.04 ###

- etc/nginx/leverage-app -> /etc/nginx/sites-enabled/leverage-app
- etc/init/leverage-api.conf -> /etc/init/leverage-api.conf

## Start services ##

### Ubuntu 14.04 ###

- nginx: `service nginx start`
- api: `start leverage-api`
