class dsu::params {
  $manage_repo = true
  $repo = 'http://linux.dell.com/repo/hardware/dsu/'
  $repo_name = 'dell-system-update'
  $repo_gpgkey = "${repo}/public.key"
  $package_name = 'dell-system-update'
  $pacakge_version = 'installed'
  $srvadmin = true
  $srvadmin_package = 'srvadmin-all'
  $srvadmin_version = 'installed'
}
