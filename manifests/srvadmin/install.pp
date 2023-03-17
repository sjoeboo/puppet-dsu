class dsu::srvadmin::install (
  $srvadmin_install_all = $::dsu::srvadmin_install_all,
  $srvadmin_package = $::dsu::srvadmin_package,
  $srvadmin_no_java_packages = $::dsu::srvadmin_no_java_packages,
  $srvadmin_version = $::dsu::srvadmin_version,
  $srvadmin_services = $::dsu::srvadmin_services,
  $srvadmin_java = 'srvadmin-jre',
  ) {
    notify{"start installing srvadmin packages, services: ${srvadmin_services}":}
    notify{"Limit selection boolean: ${srvadmin_install_limited}:${::dsu::srvadmin_install_limited}, all packages boolean: ${srvadmin_install_all}, single package list: ${$srvadmin_package}":}
    if $srvadmin_install_all == true {
      notify{"srvadmin_package: install single meta package":}
      package {
        $srvadmin_package:
          ensure  => $srvadmin_version,
          require => Class['::dsu::repo'],
      }
    }
    else {
      notify{"srvadmin_packages: will install multiple packages":}
      include ::dsu::repo
      #Install select dell packages from packages Array
      ensure_packages ($srvadmin_packages, {ensure => present})
      notify{"srvadmin_packages: installed multiple packages: ${srvadmin_packages}":}
      # If installed this will uninstall srvadmin-jre, -tomcat, -wenbserver, -all
      ensure_packages ($srvadmin_java, {ensure => absent})
    }
}
