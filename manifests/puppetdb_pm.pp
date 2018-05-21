class puppetdb_ui::puppetdb_pm {
  $pdb_postgres_host = $puppetdb_ui::pdb_postgres_host
  class {'puppetdb::master::config':
    puppetdb_server         => $pdb_postgres_host,
    manage_report_processor => true,
    enable_reports          => true
  }
}
