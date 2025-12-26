# Harden client edge devices using iptables
class clients_iptables_hardening::pre::users {
  include 'firewall'

  firewall { '000 INPUT DHCP':
    chain  => 'INPUT',
    source => '<users_dhcp_server_ip>/32',
    proto  => 'udp',
    sport  => '67',
    dport  => '68',
    jump   => 'accept',
  }
  -> firewall { '010 OUTPUT DHCP':
    chain       => 'OUTPUT',
    destination => '<users_dhcp_server_ip>/32',
    proto       => 'udp',
    sport       => '68',
    dport       => '67',
    jump        => 'accept',
  }
  -> firewall { '020 INPUT NTP':
    chain  => 'INPUT',
    source => '<users_ntp_server_ip>/32',
    proto  => 'udp',
    sport  => '123',
    jump   => 'accept',
  }
  -> firewall { '030 OUTPUT NTP':
    chain       => 'OUTPUT',
    destination => '<users_ntp_server_ip>/32',
    proto       => 'udp',
    dport       => '123',
    jump        => 'accept',
  }
  -> firewall { '040 INPUT VPN':
    chain  => 'INPUT',
    source => '<vpn_ip>/32',
    proto  => 'udp',
    sport  => '<vpn_port>',
    jump   => 'accept',
  }
  -> firewall { '050 OUTPUT VPN':
    chain       => 'OUTPUT',
    destination => '<vpn_ip>/32',
    proto       => 'udp',
    dport       => '<vpn_port>',
    jump        => 'accept',
  }
}
