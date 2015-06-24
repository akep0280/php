class php::config {



file {'/etc/php.ini':
  ensure => 'file',
  owner  => 'root',
  group  => 'root',
  mode   => '0644',
  source => 'puppet:///modules/php/php.ini',
  required => Package['php'],
  }


}
