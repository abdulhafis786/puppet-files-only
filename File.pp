file {'/tmp/test1':
ensure => present,
content => "Hi.",
before => Notify['after']
}

# one thing which I dont understand here is that why does the message does not come before the file is being created

notify {'after':
message => '/tmp/test1 has already been created',
}

file {'/tmp/test2':
ensure => directory,
mode => 644,
}
file {'/tmp/test3':
ensure => link,
target => '/tmp/test1',
}
notify {"I'm notifying you.":}
notify {"So am I!":}
