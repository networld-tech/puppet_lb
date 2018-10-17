# profile::lb
#
# Puppet 体験キット用マニフェスト
# 
#  © Networld Corporation All Rights Reserved.
#
class profile::lb () {
  include ::haproxy

  haproxy::listen { 'puppet00':
    collect_exported => false,
    ipaddress        => $facts['ipaddress'],
    ports            => '80',
  }

  Haproxy::Balancermember <<| listening_service == 'puppet00' |>>
}
