# == Class cacti::install
#
# This class is called from cacti for install.
#
class cacti::install inherits ::cacti::params{

  package { $::cacti::params::package_name:
    ensure => present,
  }
}
