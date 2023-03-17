class dsu (
  $manage_repo              = $::dsu::params::manage_repo,
  $repo                     = $::dsu::params::repo,
  $repo_name                = $::dsu::params::repo_name,
  $repo_gpgkey              = $::dsu::params::repo_gpgkey,
  $package_name             = $::dsu::params::package_name,
  $package_version          = $::dsu::params::package_version,
  $srvadmin                 = $::dsu::params::srvadmin,
  $srvadmin_package         = $::dsu::params::srvadmin_package,
  $srvadmin_package_java    = $::dsu::params::srvadmin_package_java,
  $srvadmin_packages_no_java = $::dsu::params::srvadmin_packages_no_java,
  $srvadmin_version         = $::dsu::params::srvadmin_version,
  $srvadmin_services        = $::dsu::params::srvadmin_services,
  $srvadmin_services_enable = $::dsu::params::srvadmin_services_enable,
  $srvadmin_services_ensure = $::dsu::params::srvadmin_services_ensure,
  $srvadmin_install_all     = $::dsu::params::srvadmin_install_all,
  ) inherits dsu::params {
    #Of course, only DO anything if we're a Dell system!
    if $::manufacturer {
      if $::manufacturer =~ /^Dell/ {
        include ::dsu::repo
        include ::dsu::install

        if $srvadmin {
          include ::dsu::srvadmin
        }
      }
    }

}
