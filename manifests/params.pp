# == Class: kerberos::params
#
# Provides platform-dependant default values for certain parameters of the main
# kerberos class.
#
# === Authors
#
# Jason Edgecombe <jason@rampaginggeek.com>
# Additions by Michael Weiser <michael.weiser@gmx.de>
#
# === Copyright
#
# Copyright 2013 Jason Edgecombe, unless otherwise noted.
#
class kerberos::params {

  case $::operatingsystem {
    Ubuntu, Debian: {
      $client_packages    = [ 'krb5-user' ]
      $kdc_server_packages    = [ 'krb5-kdc' ]
      $kadmin_server_packages = [ 'krb5-admin-server' ]
      $pkinit_packages        = [ 'krb5-pkinit' ]

      $krb5_conf_path         = '/etc/krb5.conf'
      $kdc_conf_path          = '/etc/krb5kdc/kdc.conf'
      $kadm5_acl_path         = '/etc/krb5kdc/kadm5.acl'
      $kdc_database_path      = '/var/lib/krb5kdc/principal'
      $kdc_stash_path         = '/etc/krb5kdc/stash'
      $kdc_logfile            = '/var/log/kdc.log'
      $kadmind_logfile        = '/var/log/kerberos_admin_server.log'
    }
    default: {
      fail("The ${module_name} module is not supported on ${::osfamily} based systems")
    }
  }
}
