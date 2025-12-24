# puppet_client_iptables_hardening

This puppet modules applies iptables rules on edge devices in order to harden them

This module applies the rules only on the **INPUT** and **OUTPUT** chains in the filter table, and does not block a local Docker install from working

## Assumptions
This module assumes that:
- Edge devices belong to one of two types of users: admins (who administrate the network) and users (who only use the network).
- Edge devices require a DHCP server
- Edge devices require a NTP server
- Admin edge devices require a https access to a firewall (probably the one who handles DHCP & NTP for the subnet)
- Edge devices access the network using a VPN server
- Any rule not defined in this puppet module can be deleted without any business impact

# Module configuration
When setting the module on a group of puppet clients, it must be given a class parameters with the name **role** and one of two values: **admin** or **user**. This allows the module to know which rules to apply on the edge device.

This also allows the admins and users edge devices to exist in different subnets, which is better from a security standpoint.