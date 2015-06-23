class php::packages {

#install REMI package repository
file {'/etc/yum.repos.d/remi.repo':
  ensure => 'file',
  owner  => 'root',
  group  => 'root',
  mode   => '0644',
  source => $::operatingsystem ? {
    'RedHat' => 'puppet:///modules/php/remi.rh.repo',
    'Scientific' => 'puppet:///modules/php/remi.sl.repo',
    'CentOS'  =>  'puppet:///modules/php/remi.rh.repo',
  }
}
#install NASBA package repository
file {'/etc/yum.repos.d/my.repo':
  ensure => 'file',
  owner  => 'root',
  group  => 'root',
  mode   => '0644',
  source => $::operatingsystem ? {
    'RedHat' => 'puppet:///modules/php/my.rh.repo',
    'Scientific' => 'puppet:///modules/php/my.sl.repo',
    'CentOS'  => 'puppet:///modules/php/my.rh.repo',
    }
  }

package { 'epel-release'
  ensure => 'present'
  }
package { 'remi-release':
  ensure => 'present',
  }
#php/git/mysql-client package list
$phpinstall = [libgd.so.3, php-fpm, php-mysql, php-opcache, php-common, php-devel, php-mcrypt, php-pear-Auth, php-pear-Auth_HTTP, php-pear-Net-URL2, MySQL-client, MySQL-shared, mod_geoip, cups, php, php-gd, php-odbc, git]
package { $phpinstall:
  ensure  => "installed",
  require => Package['remi-release'],
  }
}
