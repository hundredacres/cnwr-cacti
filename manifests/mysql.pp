# == Class cacti::mysql
#
# This class is called from cacti for database config.
# git@github.com:puppetlabs/puppetlabs-mysql.git
class cacti::mysql inherits ::cacti::params{

  class { '::mysql::server':
    root_password           => $::cacti::params::database_root_pass,
    remove_default_accounts => true,
  }

  mysql::db { 'cacti':
    user     => $::cacti::params::database_user,
    password => $::cacti::params::database_pass,
    host     => $::cacti::params::database_host,
    grant    => ['ALL'],
    sql      => '/usr/share/doc/cacti-0.8.8b/cacti.sql',
  }

}
