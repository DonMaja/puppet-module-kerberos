# === Authors
#
# Jason Edgecombe <jason@rampaginggeek.com>
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
      $krb5_conf_path         = '/etc/krb5.conf'
      $kdc_conf_path          = '/etc/krb5kdc/kdc.conf'
      $kadm5_acl_path         = '/etc/krb5kdc/kadm5.acl'
      $krb5kdc_database_path  = '/var/lib/krb5kdc/principal'
      $admin_keytab_path      = '/etc/krb5kdc/kadm5.keytab'
      $key_stash_path         = '/etc/krb5kdc/stash'
    }
    default: {
      fail("The ${module_name} module is not supported on ${::osfamily} based systems")
    }
  }
}
