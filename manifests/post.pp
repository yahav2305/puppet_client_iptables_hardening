# Harden client and admin edge devices using iptables
class clients_iptables_hardening::post {
  include 'firewall'

  firewallchain { 'INPUT:filter:IPv4':
    ensure => present,
    policy => drop,
    before => undef,
    purge  => true,
  }

  firewallchain { 'OUTPUT:filter:IPv4':
    ensure => present,
    policy => drop,
    before => undef,
    purge  => true,
  }
}
