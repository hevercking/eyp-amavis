class amavis::service inherits amavis {

  #
  validate_bool($amavis::manage_docker_service)
  validate_bool($amavis::manage_service)
  validate_bool($amavis::service_enable)

  validate_re($amavis::service_ensure, [ '^running$', '^stopped$' ], "Not a valid daemon status: ${amavis::service_ensure}")

  $is_docker_container_var=getvar('::eyp_docker_iscontainer')
  $is_docker_container=str2bool($is_docker_container_var)

  if( $is_docker_container==false or
      $amavis::manage_docker_service)
  {
    if($amavis::manage_service)
    {
      service { $amavis::params::service_name:
        ensure => $amavis::service_ensure,
        enable => $amavis::service_enable,
      }
    }
  }
}
