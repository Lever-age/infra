srcdir='/usr/local/src/frontend'
dstdir='/usr/local/www'
index='discover.html'

( cd $srcdir && git pull )

rsync -va --info=stats0,flist0 $srcdir/*.html $dstdir/
rsync -va --info=stats0,flist0 $srcdir/assets/ $dstdir/assets/

if ! [ "$(readlink $dstdir/index.html)" = "$index" ]; then
  rm -vf $dstdir/index.html
  ln -vs $index $dstdir/index.html
fi
