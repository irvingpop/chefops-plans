pkg_name=elasticsearch
pkg_origin=chefops
pkg_version=2.3.2
pkg_maintainer="Ben Rockwood <benr@chef.io>"
pkg_license=('Revised BSD')
pkg_source=https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/${pkg_version}/${pkg_name}-${pkg_version}.tar.gz
pkg_filename=${pkg_name}-${pkg_version}.tar.gz
pkg_shasum=04c4d3913d496d217e038da88df939108369ae2e78eea29cb1adf1c4ab3a000a
pkg_deps=(core/glibc chefops/jdk8)
pkg_bin_dirs=(bin)
pkg_lib_dirs=(lib)

pkg_expose=(9200 9300)
pkg_svc_run="es/bin/elasticsearch --default.path.conf=${pkg_svc_config_path} 2>&1"

do_build() {
  return 0
}

do_install() {
  build_line "Copying files from $PWD"
  mkdir -p $pkg_prefix/es
  cp -r * $pkg_prefix/es
}

