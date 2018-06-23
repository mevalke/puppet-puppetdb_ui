class puppetdb_ui::puppetdb_setup {
  package {'apt-transport-https':
    ensure => present
  }
  class {'puppetdb::server':
    database_host => '127.0.0.1',
  }
  class {'puppetdb::database::postgresql':
    listen_addresses 	=> '127.0.0.1',
  }
}
