class dsu::srvadmin::install (
  $srvadmin_package = $::dsu::srvadmin_package,
  $srvadmin_version = $::dsu::srvadmin_version,
  $srvadmin_packages = $::dsu::srvadmin_packages,
  ) {
    notify{"start installing srvadmin packages":}
    if $srvadmin_packages != undef {
    notify{"srvadmin_packages: will install multiple packages":}
      include ::dsu::repo
      #Install select dell packages from packages Array
      ensure_packages ($srvadmin_packages, {ensure => present})
      notify{"srvadmin_packages: installed multiple packages: ${srvadmin_packages}":}
    }
    elsif $srvadmin_package != undef {
      notify{"srvadmin_package: install single meta package":}
      package {
        $srvadmin_package:
          ensure  => $srvadmin_version,
          require => Class['::dsu::repo'],
      }
    }
}
