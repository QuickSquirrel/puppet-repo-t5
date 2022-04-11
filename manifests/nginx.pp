node 'master.puppet' {

 package { ['nginx', 'policycoreutils-python-utils-2.9-16.el8.noarch']:
  ensure => latest,
 }

 file {'/usr/share/nginx/html/index.html':
  ensure => file,
  source => 'puppet:///modules/static/index.html'
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
