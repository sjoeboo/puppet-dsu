class dsu::srvadmin::install (
  $srvadmin_package = $::dsu::srvadmin_package,
  $srvadmin_version = $::dsu::srvadmin_version,
  $srvadmin_packages = $::dsu::srvadmin_packages,
  ) {
    notify{"start installing srvadmin packages":}
    if $srvadmin_packages != undef {
      # notify{"srvadmin_packages: install multiple packages"}
      include ::dsu::repo
      #Install select dell packages from packages Array
      $packages=hiera_array('srvadmin_packages', Data, hash, {})
      ensure_packages ($packages, {ensure => present})
    }
    elsif $srvadmin_package != undef {
      # notify{"srvadmin_package: install single meta package":}
      package {
        $srvadmin_package:
          ensure  => $srvadmin_version,
          require => Class['::dsu::repo'],
      }
    }
}
