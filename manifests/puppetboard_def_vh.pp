class puppetdb_ui::puppetboard_def_vh {
  class { 'apache':
    purge_configs => false,
    mpm_module    => 'prefork',
    default_vhost => true,
    default_mods  => true,
  }
  class { 'apache::mod::wsgi': }
  class { 'puppetboard':
    default_environment => '*',
    manage_git          => true,
    manage_virtualenv   => true,
    reports_count       => 40,
    groups              => 'puppet',
    puppetdb_host       => '127.0.0.1',
    puppetdb_port       => 8080,
  }
  class { 'puppetboard::apache::conf': }
  exec {'disable mpm-event':
    command => 'sed -i -e \'/LoadModule/ s/^#*/#/\' /etc/apache2/mods-enabled/mpm_event.load',
    path    => '/bin',
    onlyif  => 'egrep -v "^#" /etc/apache2/mods-enabled/mpm_event.load',
    notify  => Class['apache::service'],
  }
}
