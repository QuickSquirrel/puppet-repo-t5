node 'master.puppet' {

 selinux::port { 'non-standard-http-port':
    ensure   => 'present',
    seltype  => 'http_port_t',
    protocol => 'tcp',
    port     => 8081,
 }

 service { 'firewalld':
  ensure => stopped,
  enable => false,
 }

 include nginx
  
 nginx::resource::server { 'static':
   listen_port => 8080,
   proxy       => 'http://192.168.50.10:80',
 }

 nginx::resource::server { 'dynamic':
   listen_port => 8081,
   proxy       => 'http://192.168.50.20:80',
 }
}
