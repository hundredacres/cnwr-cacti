# == Class: cacti
#
# Full description of class cacti here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class cacti (
  $package_name = $::cacti::params::package_name,
  $managed_services = $::cacti::params::managed_services,
  $dependencies = $::cacti::params::dependencies,
  $database_root_pass = $::cacti::params::database_root_pass,
  $database_type = $::cacti::params::database_type,
  $database_default = $::cacti::params::database_default,
  $database_host = $::cacti::params::database_host,
  $database_user = $::cacti::params::database_user,
  $database_pass = $::cacti::params::database_pass,
  $database_port = $::cacti::params::database_port,
  $database_ssl = $::cacti::params::database_ssl
) inherits ::cacti::params {

  # validate parameters here

  class { '::cacti::deps': } ->
  class { '::cacti::install': } ->
  class { '::cacti::mysql': } ->
  class { '::cacti::config': } ~>
  class { '::cacti::service': } ->
  Class['::cacti']
}
