class dsu::srvadmin::install (
  $srvadmin_package = $::dsu::srvadmin_package,
  $srvadmin_version = $::dsu::srvadmin_version,
  ) {
    package{$srvadmin_package:
      ensure  => $srvadmin_version,
      require => Class['::dsu::repo'],
    }
}
