node 'master.puppet' {

 package { ['nginx', 'policycoreutils-python-utils-2.9-16.el8.noarch']:
  ensure => latest,
 }

 file {'/usr/share/nginx/html/index.html':
  ensure => file,
  source => 'puppet:///modules/master/index.html'
 }

 selinux::port { 'non-standard-http-port':
    ensure   => 'present',
    seltype  => 'http_port_t',
    protocol => 'tcp',
    port     => 8081,
  }


  nginx::resource::server { '192.168.50.5':
   listen_port => 8080,
   proxy       => 'http://192.168.50.10',
  }


  nginx::resource::server { '192.168.50.5':
   listen_port => 8081,
   proxy       => 'http://192.168.50.20',
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
