# == Class cacti::install
#
# This class is called from cacti for install.
#
class cacti::install {

  package { $::cacti::package_name:
    ensure => present,
  }
}
