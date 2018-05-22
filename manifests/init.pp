# Class: puppetdb_ui
# ===========================
#
# Full description of class puppetdb_ui here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'puppetdb_ui':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# mevalke@gmail.com
#
# Copyright
# ---------
#
# Copyright 2018 Your name here, unless otherwise noted.
class puppetdb_ui {  
  $pdb_mode          = lookup(pdb_mode)
  
  case $pdb_mode {
   'pdb': {
     $pdb_puppetserver  = lookup(pdb_puppetserver)
     $pdb_fw_on         = lookup(pdb_fw_on)
     
     include puppetdb_ui::puppetdb_setup
     include puppetdb_ui::puppetboard_def_vh
     group {'puppet': ensure => present, }     
     if $pdb_fw_on == true {
       include firewall_linux
       include puppetdb_ui::firewall
     }
   }
   'pm': {
     $pdb_postgres_host = lookup(pdb_postgres_host)
     include puppetdb_ui::puppetdb_pm
   }
   default: {
     fail "Puppetdb mode was not defined."
   }
  }
}
#
