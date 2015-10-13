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
  $cacti_package = $::cacti::params::cacti_package,
  $database_root_pass,
  $database_pass,
  $database_user = $::cacti::params::database_user,
  $database_host = $::cacti::params::database_host,
  $database_default = $::cacti::params::database_default,
  $database_port = $::cacti::params::database_port,
  $database_ssl = $::cacti::params::database_ssl,
  $managed_services = $::cacti::params::managed_services,

) inherits ::cacti::params {

  include ::cacti::install
  include ::cacti::mysql
  include ::cacti::config
  include ::cacti::service

  anchor { 'cacti::begin': } ->
    Class['cacti::install'] ->
    Class['cacti::mysql'] ->
    Class['cacti::config'] ->
    Class['cacti::service'] ->
  anchor { 'cacti::end': }

}
