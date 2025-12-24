class clients_iptables_hardening::pre::admins {
  include 'firewall'

  firewall {'000 INPUT DHCP':
    chain => 'INPUT',
    source => '<admin_dhcp_server_ip>/32',
    proto => 'udp',
    sport => '67',
    dport => '68',
    jump => 'accept',
  }
  -> firewall {'010 OUTPUT DHCP':
    chain => 'OUTPUT',
    destination => '<admin_dhcp_server_ip>/32',
    proto => 'udp',
    sport => '68',
    dport => '67',
    jump => 'accept',
  }
  -> firewall {'020 INPUT NTP':
    chain => 'INPUT',
    source => '<admin_ntp_server_ip>/32',
    proto => 'udp',
    sport => '123',
    jump => 'accept',
  }
  -> firewall {'030 OUTPUT NTP':
    chain => 'OUTPUT',
    destination => '<admin_ntp_server_ip>/32',
    proto => 'udp',
    dport => '123',
    jump => 'accept',
  }
  -> firewall {'031 FW Web UI Access':
    chain => 'INPUT',
    source => '<admin_default_gateway_ip>/32',
    proto => 'tcp',
    sport => '443',
    jump => 'accept',
  }
  -> firewall {'032 FW Web UI Access':
    chain => 'OUTPUT',
    destination => '<admin_default_gateway_ip>/32',
    proto => 'tcp',
    dport => '443',
    jump => 'accept',
  }
  -> firewall {'040 INPUT VPN':
    chain => 'INPUT',
    source => '<vpn_ip>/32',
    proto => 'all',
    jump => 'accept',
  }
  -> firewall {'050 OUTPUT VPN':
    chain => 'OUTPUT',
    destination => '<vpn_ip>/32',
    proto => 'all',
    jump => 'accept',
  }
}
