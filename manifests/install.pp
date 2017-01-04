class amavis::install inherits amavis {

  if($amavis::setup_clamav)
  {
    class { 'clamav': }
    class { 'clamav::freshclam': } ->
    class { 'clamav::server': } ->
    clamav::server::instance { 'amavisd':
    }
  }

  if($amavis::setup_spamassassin)
  {
    class { 'spamassassin': }
  }

  if($amavis::manage_package)
  {
    package { $amavis::params::package_name:
      ensure => $amavis::package_ensure,
    }
  }

}
