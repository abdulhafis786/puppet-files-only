class ntp {
case $operatingsystem {
centos, redhat: {
$service_name = 'ntpd'
}
debian, ubuntu: {
$service_name = 'ntp'
}
}
package { 'ntp':
ensure => installed,
}
service { 'ntp':
name => $service_name,
ensure => stopped,
enable => false,
subscribe => File['ntp.conf'],
}
file { 'ntp.conf':
path => '/etc/ntp.conf',
ensure => file,
require => Package['ntp'],
}
}
