# == Class cacti::install
#
# This class is called from cacti for installing dependencies.
# The puppetlabs-mysql manifests manage the database
#
class cacti::deps inherits ::cacti::params {

  package { $::cacti::params::dependencies:
    ensure => present,
  }

}
