# == Class cacti::params
#
# This class is meant to be called from cacti.
# It sets variables according to platform.
#
class cacti::params {
  $cacti_version = '1.1.19' 
  $database_user = 'cacti'
  $database_host = 'localhost'
  $database_type = 'mysql'
  $database_default = 'cacti'
  $database_port = '3306'
  $database_ssl = false
  $managed_services = []
  $mysql_package_name = undef
  $mysql_service_name = 'mysqld'
  $mysql_override_options = undef
  $database_root_pass = undef
  $database_pass = undef

  case $::osfamily {
    'RedHat': {
      case $::operatingsystemmajrelease {
        '6','7': {
          $cacti_package = 'cacti'
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
}
