class dsu::params {
  $manage_repo = true
  $repo = 'http://linux.dell.com/repo/hardware/dsu/'
  $repo_name = 'dell-system-update'
  $repo_gpgkey = "${repo}/public.key"
  $package_name = 'dell-system-update'
  $package_version = 'latest'
  $srvadmin = true
  $srvadmin_package = 'srvadmin-all'
  $srvadmin_packages = ['srvadmin-argtable2', 'srvadmin-base', 'srvadmin-deng', 'srvadmin-deng-snmp', 'srvadmin-hapi',
    'srvadmin-idrac', 'srvadmin-idracadm7', 'srvadmin-isvc', 'srvadmin-isvc-snmp', 'srvadmin-itunnelprovider', 'srvadmin-marvellib',
    'srvadmin-nvme', 'srvadmin-omacore', 'srvadmin-omacs', 'srvadmin-omaksmig', 'srvadmin-omcommon', 'srvadmin-omilcore', 'srvadmin-ominst',
    'srvadmin-oslog', 'srvadmin-realssd', 'srvadmin-server-cli', 'srvadmin-server-snmp', 'srvadmin-smcommon', 'srvadmin-smweb',
    'srvadmin-standardAgent', 'srvadmin-storage', 'srvadmin-storage-cli', 'srvadmin-storage-snmp', 'srvadmin-storageservices',
    'srvadmin-storageservices-cli', 'srvadmin-storageservices-snmp', 'srvadmin-storelib', 'srvadmin-storelib-sysfs', 'srvadmin-sysfsutils',
    'srvadmin-xmlsup']
  $srvadmin_version = 'latest'
  $srvadmin_services = ['dsm_sa_eventmgrd','dsm_sa_datamgrd','dsm_sa_snmpd','dsm_om_shrsvc','instsvcdrv']
  $srvadmin_services_enable = true
  $srvadmin_services_ensure = 'running'
}
