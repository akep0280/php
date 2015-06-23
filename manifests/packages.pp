class php::packages {

#install REMI package repository
file {'/etc/yum.repos.d/remi.repo':
  ensure => 'file',
  owner  => 'root'
  group  => 'root',
  mode   => '0644',
  source => $::operatingsystem ? {
    'RedHat' => 'puppet:///modules/php/remi.rh.repo',
    'Scientific' => 'puppet:///modules/php/remi.sl.repo',
    'default'  => fail("Unsupported OS: ${::operatingsystem}"),
  }

#install NASBA package repository
file {'/etc/yum.repos.d/my.repo'}
  ensure => 'file',
  owner  => 'root',
  group  => 'root',
  mode   => '0644',
  source => $::operatingsystem ? {
    'RedHat' => 'puppet:///modules/php/my.rh.repo',
    'Scientific' => 'puppet:///modules/php/my.sl.repo',
    'default'  => fail("Unsupported OS: ${::operatingsystem}"),
  }
