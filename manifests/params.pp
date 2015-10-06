# == Class cacti::params
#
# This class is meant to be called from cacti.
# It sets variables according to platform.
#
class cacti::params {
  case $::osfamily {
    'RedHat': {
      case $::operatingsystemmajrelease {
        '7': {
          $package_name = 'cacti'
          $managed_services = [ 'httpd', 'snmpd' ]
          $dependencies = [ 'httpd', 'httpd-devel', 'php-mysql', 'php-pear',
            'php-common', 'php-gd', 'php-devel', 'php', 'php-mbstring',
            'php-cli', 'php-snmp', 'net-snmp-utils', 'net-snmp-libs',
            'rrdtool' ]
        }
        default: {
          fail("${::operatingsystem} ${::operatingsystemmajrelease} not supported")
        }
      }
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }

  $database_root_pass = hiera(cacti::database::root_pass)
  $database_type = hiera(cacti::database::type, 'mysql')
  $database_default = hiera(cacti::database::default, 'cacti')
  $database_host = hiera(cacti::database::host, 'localhost')
  $database_user = hiera(cacti::database::user, 'cacti')
  $database_pass = hiera(cacti::database::pass)
  $database_port = hiera(cacti::database::port, '3306')
  $database_ssl = hiera(cacti::database::ssl, false)
}
