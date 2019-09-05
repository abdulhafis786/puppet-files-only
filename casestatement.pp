case $operatingsystem {
  centos: { $apache = "httpd" }
  ubuntu: { $apache = "apache2" }
  redhat: { $apache = "httpd" }
  debian: { $apache = "apache2" }
  default: { fail( "Unrecognized operating system") }
}
package {'apache':
 name => $apache,
 ensure => latest,
}
