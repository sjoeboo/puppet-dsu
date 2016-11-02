class dsu::repo (
  $manage_repo = $::dsu::manage_repo,
  $repo        = $::dsu::repo,
  $repo_name   = $::dsu::repo_name,
  $repo_gpgkey = $::dsu::repo_gpgkey,
  ) {
    if $manage_repo {

      if $::architecture == 'x86_64' {
        $excluded_arch = 'i386'
        $arch = '64'
      } else {
        raise('Arch not supported!')
      }

      if $::osfamily == 'RedHat' {
        $dist = 'RHEL'
      }
      else {
        raise('OS not supported')
      }

      yumrepo {"${repo_name}_os_independent":
        baseurl  => "${repo}os_independent/",
        descr    => "${repo_name}_os_independent",
        gpgkey   => $repo_gpgkey,
        enabled  => '1',
        gpgcheck => '1',
        exclude  => "dell-system-update*${excluded_arch}",
      }
      #url is really like http://linux.dell.com/repo/hardware/dsu/os_dependent/RHEL7_64/


      yumrepo { "${repo_name}_os_dependent":
        baseurl  => "${repo}os_dependent/${dist}${::operatingsystemmajrelease}_${arch}/",
        descr    => "${repo_name}_os_dependent",
        enabled  => '1',
        gpgcheck => '1',
        gpgkey   => $repo_gpgkey,
      }
    }
  }
