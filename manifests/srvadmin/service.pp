class dsu::srvadmin::service (
  $services = $::dsu::srvadmin_services,
  $enable = $::dsu::srvadmin_services_enable,
  $ensure = $::dsu::srvadmin_services_ensure,
  ) {
    $services.each |String $srv| {
      service { $srv:
        ensure => $ensure,
        enable => $enable,
      }
    }

  }
