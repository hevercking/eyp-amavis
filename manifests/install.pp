class amavis::install inherits amavis {

  if($amavis::manage_package)
  {
    package { $amavis::params::package_name:
      ensure => $amavis::package_ensure,
    }
  }

}
