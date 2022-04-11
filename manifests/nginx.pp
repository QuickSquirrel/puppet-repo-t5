node 'master.puppet' {

 package { 'nginx':
  ensure => latest,
 }


 service { 'nginx':
  ensure => running,
  enable => true,
 }

 service { 'firewalld':
  ensure => stopped,
  enable => false,
 }
}
