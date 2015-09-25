# == Class cacti::mysql
#
# This class is called from cacti for database config.
# git@github.com:puppetlabs/puppetlabs-mysql.git
class cacti::mysql {

  class { '::mysql::server':
    root_password => $::cacti::database_root_pass,
    remove_default_accounts => true,
  }

}
