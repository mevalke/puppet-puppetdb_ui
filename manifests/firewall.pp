class puppetdb_ui::firewall {
  firewall_multi {'10 allow puppetdb connections from master':
    dport  => [ 8081 ],
    proto  => tcp,
    source => $puppetdb_ui::pdb_puppetserver,
    action => accept,
  }
}

