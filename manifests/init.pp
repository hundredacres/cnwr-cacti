# == Class: cacti
#
# Full description of class cacti here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class cacti inherits ::cacti::params {

  class { '::cacti::deps': } ->
  class { '::cacti::install': } ->
  class { '::cacti::mysql': } ->
  class { '::cacti::config': } ~>
  class { '::cacti::service': } ->
  Class['::cacti']

}
