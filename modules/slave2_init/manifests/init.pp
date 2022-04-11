 class slave2_init {
 
 package { ['httpd','php'] :
  ensure => latest,
 }

 file {'/var/www/html/index.php':
  ensure => file,
  source => 'puppet:///modules/slave2_init/index.php'
 }
 
 service { 'httpd':
  ensure => running,
  enable => true,
 }
 
 service { 'firewalld':
  ensure => stopped,
  enable => false,
 }
 
 file {'/root/README':
  ensure => absent,
 }
}
