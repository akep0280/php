class php::config {
  include stdlib



#file {'/etc/php.ini':
  #ensure   => 'file',
  #owner    => 'root',
  #group    => 'root',
  #mode     => '0644',
  #source   => 'puppet:///modules/php/php.ini',
  #require  => Package['php'],
  #}

  file_line { 'expose_off':
    path  => '/etc/php.ini',
    line  => 'expose_php = Off',
    match => '^expose_php = On',
    notify => Service["httpd"],
  }
  file_line { 'session_1':
    path  => '/etc/php.ini',
    line  => 'session.name = NASBA',
    notify => Service["httpd"],
    }
  file_line { 'session_2':
    path  => '/etc/php.ini',
    line  => 'session.cookie_secure = 1',
    notify => Service["httpd"],
    }
  file_line { 'session_3':
    path  => '/etc/php.ini',
    line  => 'session.hash_function = 1',
    notify => Service["httpd"],
    }
  file_line { 'session_4':
    path  => '/etc/php.ini',
    line  => 'session.cookie_httponly = 1',
    notify => Service["httpd"],
    }

}
