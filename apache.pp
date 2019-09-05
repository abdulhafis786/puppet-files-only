case $operatingsystem {
centos, redhat: {
$service_name = 'httpd'
}
debian, ubuntu: {
$service_name = 'apachectl'
}
}
package { 'httpd':
ensure => installed,
}
service { 'httpd':
ensure => stopped,
name => $service_name,
enable => false,
# subscribe => File['httpd.conf'],
}
#Editing the file to comment out the Default welcome.conf
file { 'welcome.conf':
path => '/etc/httpd/conf.d/welcome.conf',
ensure => file,
source => "/tmp/welcome.conf",
}
#A new index.html page is already present so copying that to the target location
file { 'index.html':
path => '/var/www/html/index.html',
ensure => file,
source => "/var/index.html",
}
------------------------------------------------------------------------

exec { 'yum_update':
command => '/usr/bin/yum update',
}

package { 'httpd':
ensure => installed,
require => Exec['yum_update'],
}

service { 'httpd':
ensure => stopped,
}

file { '/var/www/html/index.html':
ensure => file,
require => Package['httpd'],
}
