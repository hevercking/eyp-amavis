class amavis(
              $manage_package        = true,
              $package_ensure        = 'installed',
              $manage_service        = true,
              $manage_docker_service = true,
              $service_ensure        = 'running',
              $service_enable        = true,
              $install_clamav        = true,
              $max_servers           = '2',
              $mydomain              = $::domain,
              $myhostname            = $::fqdn,
              $listen_port           = '10024',
            ) inherits amavis::params{

  validate_re($package_ensure, [ '^present$', '^installed$', '^absent$', '^purged$', '^held$', '^latest$' ], 'Not a supported package_ensure: present/absent/purged/held/latest')

  class { '::amavis::install': } ->
  class { '::amavis::config': } ~>
  class { '::amavis::service': } ->
  Class['::amavis']

}
