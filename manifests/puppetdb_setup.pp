class puppetdb_ui::puppetdb_setup {
  package {'apt-transport-https':
    ensure => present
  }
  class {'puppetdb::server':
    database_host => $puppetdb_ui::pdb_postgres_host,
  }
  class {'puppetdb::database::postgresql':
    listen_addresses 	=> $puppetdb_ui::pdb_postgres_host,
  }
}
