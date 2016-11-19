class amavis::config inherits amavis {

  #/etc/amavisd/amavisd.conf
  file { '/etc/amavisd/amavisd.conf':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("${module_name}/amavisconf.erb"),
  }

}
