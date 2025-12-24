class clients_iptables_hardening::flush_chains {
  include 'firewall'

  firewallchain { 'INPUT:filter:IPv4':
    ensure => 'present',
    purge => true,
  }

  firewallchain { 'OUTPUT:filter:IPv4':
    ensure => 'present',
    purge => true,
  }
}
