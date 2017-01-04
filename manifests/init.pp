class amavis(
              $manage_package        = true,
              $package_ensure        = 'installed',
              $manage_service        = true,
              $manage_docker_service = true,
              $service_ensure        = 'running',
              $service_enable        = true,
              $setup_clamav          = true,
              $setup_spamassassin    = true,
              $max_servers           = '2',
              $mydomain              = $::domain,
              $myhostname            = $::fqdn,
              $listen_port           = '10024',
              $username              = 'amavis',
              $group                 = 'amavis',
              $log_level             = '0',
              $syslog_facility       = 'mail',
              $mydomain              = $::domain,
              $bypass_spam_checks    = false,
              $bypass_decode_parts   = false,
              $bypass_virus_checks   = false,
            ) inherits amavis::params{

  validate_re($package_ensure, [ '^present$', '^installed$', '^absent$', '^purged$', '^held$', '^latest$' ], 'Not a supported package_ensure: present/absent/purged/held/latest')

  class { '::amavis::install': } ->
  class { '::amavis::config': } ~>
  class { '::amavis::service': } ->
  Class['::amavis']

}
