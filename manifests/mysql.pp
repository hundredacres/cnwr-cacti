# == Class cacti::mysql
#
# This class is called from cacti for database config.
# git@github.com:puppetlabs/puppetlabs-mysql.git
class cacti::mysql inherits ::cacti{

  class { '::mysql::server':
    override_options        => $::cacti::mysql_override_options,
    package_name            => $::cacti::mysql_package_name,
    root_password           => $::cacti::database_root_pass,
    service_name            => $::cacti::mysql_service_name,
    remove_default_accounts => true,
  }

  mysql::db { 'cacti':
    user     => $::cacti::database_user,
    password => $::cacti::database_pass,
    host     => $::cacti::database_host,
    grant    => ['ALL'],
    sql      => "/usr/share/doc/cacti-${cacti_version}/cacti.sql",
  }

}
