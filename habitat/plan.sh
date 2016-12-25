pkg_origin=leverage
pkg_name=leverage
pkg_version=0.1.0
pkg_maintainer="Chris Alfano <chris@codeforphilly.org>"
pkg_license=(MIT)
pkg_upstream_url=https://github.com/Lever-age/leverage
pkg_source=leverage.tar.gz
pkg_deps=(bochener/node)
pkg_expose=(80)
pkg_build_deps=(core/coreutils core/git)
pkg_interpreters=(bin/env)

do_download() {
  return 0
}

do_verify() {
  return 0
}

do_unpack() {
  return 0
}

do_prepare() {
  # The `/usr/bin/env` path is hardcoded, so we'll add a symlink if needed.
  # We can't do fix_interpreter here without adding a coreutils runtime dep.
  if [[ ! -r /usr/bin/env ]]; then
    ln -sv "$(pkg_path_for coreutils)/bin/env" /usr/bin/env
    _clean_env=true
  fi
}

do_build() {
  git clone --depth 1 --branch develop https://github.com/Lever-age/api.git $HAB_CACHE_SRC_PATH/$pkg_dirname/api
  git clone --depth 1 --branch develop https://github.com/Lever-age/frontend.git $HAB_CACHE_SRC_PATH/$pkg_dirname/frontend

  cd $HAB_CACHE_SRC_PATH/$pkg_dirname/api
  npm install
}

do_install() {
  # Our source files were copied over to HAB_CACHE_SRC_PATH/$pkg_dirname in do_build(),
  # and now they need to be copied from that directory into the root directory of our package
  # through the use of the pkg_prefix variable.

  mkdir -p ${pkg_prefix}/api
  cp -v api/package.json ${pkg_prefix}/api
  cp -v api/app.js ${pkg_prefix}/api
  cp -vr api/controllers ${pkg_prefix}/api
  cp -vr api/lib ${pkg_prefix}/api
  cp -r api/node_modules ${pkg_prefix}/api

  mkdir -p ${pkg_prefix}/frontend
  cp -v frontend/*.html ${pkg_prefix}/frontend
  cp -vr frontend/assets ${pkg_prefix}/assets
  ln -vs discover.html ${pkg_prefix}/frontend/index.html
}

do_end() {
  # Clean up the `env` link, if we set it up.
  if [[ -n "$_clean_env" ]]; then
    rm -fv /usr/bin/env
  fi
}
