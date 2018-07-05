class puppetdb_ui::puppetdb_setup {
  exec { disable_apt_cdrom_source:
    command => "/bin/sed -i '/cdrom/s/^/#/g' /etc/apt/sources.list",
    onlyif  => "grep -E '^deb cdrom' /etc/apt/sources.list",
    path    => '/bin:/usr/bin:/usr/local/bin',
  } ->
  exec { update_apt_cache:
    command => "/usr/bin/apt-get update",
    path    => '/bin:/usr/bin:/usr/local/bin',
  } ->
  package {'apt-transport-https':
    ensure => present
  } ->
  class {'puppetdb::server':
    database_host => '127.0.0.1',
  } ->
  class {'puppetdb::database::postgresql':
    listen_addresses 	=> '127.0.0.1',
  }
}
