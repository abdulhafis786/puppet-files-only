host {'self':
 ensure => present,
 name => $::hostname,
}

file {'motd':
 ensure => file,
 path => '/tmp/motd',
 mode => 0644,
 content => "Welcome to ${::hostname} \n and ${::operatingsystem} in a land of with nothing",
}
