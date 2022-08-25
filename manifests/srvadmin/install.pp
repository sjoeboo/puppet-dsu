class dsu::srvadmin::install (
  $srvadmin_install_all = $::dsu::srvadmin_install_all,
  $srvadmin_install_limited = $::dsu::srvadmin_install_limited,
  $srvadmin_package = $::dsu::srvadmin_package,
  $srvadmin_packages = $::dsu::srvadmin_packages,
  $srvadmin_version = $::dsu::srvadmin_version,
  $srvadmin_services = $::dsu::srvadmin_services,
  ) {
    notify{"start installing srvadmin packages, services: ${srvadmin_services}":}
    notify{"Limit selection boolean: ${srvadmin_install_limited}, all packages boolean: ${srvadmin_install_all}, single package list: ${$srvadmin_package}":}
    if $srvadmin_install_limited == true {
      notify{"srvadmin_packages: will install multiple packages":}
      include ::dsu::repo
      #Install select dell packages from packages Array
      ensure_packages ($srvadmin_packages, {ensure => present})
      notify{"srvadmin_packages: installed multiple packages: ${srvadmin_packages}":}
    }
    elsif $srvadmin_install_all == true {
      notify{"srvadmin_package: install single meta package":}
      package {
        $srvadmin_package:
          ensure  => $srvadmin_version,
          require => Class['::dsu::repo'],
      }
    }
}
