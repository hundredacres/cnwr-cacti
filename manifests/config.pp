# == Class cacti::config
#
# This class is called from cacti for service config.
#
class cacti::config {

  file { '/etc/cacti/db.php':
    ensure => present,
    content => template('cacti/etc/cacti/db.erb'),
    mode => '0640',
    owner => 'cacti',
    group => 'apache',
  }


}
