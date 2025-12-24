class clients_iptables_hardening::pre::base {
  include 'firewall'

  firewall {'060 INPUT Related Established':
    chain => 'INPUT',
    proto => 'all',
    state => ['RELATED', 'ESTABLISHED'],
    jump => 'accept',
  }
  -> firewall {'070 OUTPUT Related Established':
    chain => 'OUTPUT',
    proto => 'all',
    state => ['RELATED', 'ESTABLISHED'],
    jump => 'accept',
  }
  -> firewall {'080 INPUT loopback':
    chain => 'INPUT',
    iniface => 'lo',
    proto => 'all',
    jump => 'accept',
  }
  -> firewall {'090 OUTPUT loopback':
    chain => 'OUTPUT',
    outiface => 'lo',
    proto => 'all',
    jump => 'accept',
  }
  -> firewall {'100 INPUT tun0':
    chain => 'INPUT',
    iniface => 'tun0',
    proto => 'all',
    jump => 'accept',
  }
  -> firewall {'110 OUTPUT tun0':
    chain => 'OUTPUT',
    outiface => 'tun0',
    proto => 'all',
    jump => 'accept',
  }
}
