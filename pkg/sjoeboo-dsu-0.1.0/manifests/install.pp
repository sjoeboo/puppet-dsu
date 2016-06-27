class dsu::install (
  $package_name    = $::dsu::package_name,
  $package_version = $::dsu::package_version,
  ) {

    package {$package_name:
      ensure  => $package_version,
      require => Class['::dsu::repo'],
    }
}
