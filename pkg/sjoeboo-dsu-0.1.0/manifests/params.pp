class dsu::params {
  $manage_repo = true
  $repo = 'http://linux.dell.com/repo/hardware/dsu/'
  $repo_name = 'dell-system-update'
  $repo_gpgkey = "${repo}/public.key"
  $package_name = 'dell-system-update'
  $package_version = 'installed'
  $srvadmin = true
  $srvadmin_package = 'srvadmin-all'
  $srvadmin_version = 'installed'
  $srvadmin_services = ['dataeng','dsm_om_connsvc','dsm_om_shrsvc','instsvcdrv']
  $srvadmin_services_enable = true
  $srvadmin_services_ensure = 'running'
}
