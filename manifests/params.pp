# == Class cacti::params
#
# This class is meant to be called from cacti.
# It sets variables according to platform.
#
class cacti::params {
  case $::osfamily {
    'RedHat': {
      case $::hardwaremodel {
        'x86_64': {
          $package_name = 'cacti'
          $managed_services = [ 'httpd', 'snmpd' ]
          $dependecies = [ 'httpd', 'httpd-devel', 'php-mysql', 'php-pear',
            'php-common', 'php-gd', 'php-devel', 'php', 'php-mbstring',
            'php-cli', 'php-snmp', 'net-snmp-utils', 'net-snmp-libs',
            'rrdtool' ]
          $database_root_pass = hiera(cacti::database::root_pass, undef),
        }
        default: {
          fail("${::hardwaremodel} not supported")
        }
      }
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
