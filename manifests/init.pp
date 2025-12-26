# Harden client using iptables
#
# [*role*]
#   The type of client, changes the type of rules applied on the client
class clients_iptables_hardening ( Enum['admin', 'user'] $role ) {
  include 'firewall'

  if $role == 'user' {
    include clients_iptables_hardening::pre::users
  } elsif $role == 'admin' {
    include clients_iptables_hardening::pre::admins
  }

  include clients_iptables_hardening::pre::base

  include clients_iptables_hardening::post
}
