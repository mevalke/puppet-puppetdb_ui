# puppetdb_ui

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with puppetdb_ui](#setup)
    * [Setup requirements](#setup-requirements)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

This module attempts to simplify the set up of [Puppetdb](https://forge.puppet.com/puppetlabs/puppetdb) and [Puppetboard](https://forge.puppet.com/puppet/puppetboard).

## Setup

### Setup Requirements

Installing the dependencies.

```
puppet module install puppetlabs-firewall --version 1.12.0
puppet module install alexharvey-firewall_multi --version 1.10.0
puppet module install puppetlabs-puppetdb --version 6.0.2
puppet module install puppetlabs-apache --version 3.1.0
puppet module install puppet-puppetboard --version 4.1.0
git clone https://github.com/mevalke/puppet-firewall_linux.git firewall_linux
```

## Usage

For example in site.pp:

```
node 'puppetdbhost.example.com' {
  include puppetdb_ui
}

node 'puppetserver.example.com' {
  include puppetdb_ui
}
```

The parameters are provided via Hiera.

Setting up the parameters for the Puppet Server.

```
---
pdb_mode: 'pm'
pdb_postgres_host: 'puppetdbhost.example.com'
```

Setting up the parameters for the Puppetdb host.

```
---
pdb_mode: 'pdb'
pdb_puppetserver: 'puppetserver.example.com'
pdb_fw_on: true
firewall_linux_ssh_access:
 - '11.12.13.14'
```
## Limitations

This module has been tested in a lab environment only. I´m intending to release a blog post where a complete usage example is presented. Until then the documentation is incomplete.

## Development

Any form of contribution is welcomed.

## Release Notes/Contributors/Etc.

0.1.0: First release
