class mcft_init {

 package {'java-17-openjdk':
  ensure => installed
 }
 
 file {'/opt/minecraft':
  ensure => directory
 }
 
 file {'/opt/minecraft/eula.txt':
  content => 'eula=true',
 }
 
 file {'/opt/minecraft/minecraft_server.jar':
  ensure => file,
  source => 'file:///vagrant/minecraft_server.jar',
 }
 
 file {'/etc/systemd/system/minecraft.service':
  ensure => file,
  source => 'puppet:///modules/mcft_init/minecraft.service'
 }
 ~> service { 'minecraft':
  ensure => running,
  enable => true
 }
 
 file_line { online-mode:
  path   => "/opt/minecraft/server.properties",
  line   => "online-mode=false",
  match  => "^online-mode=",
  notify => Service['minecraft'],
 }

# service { minecraft:
#    ensure => running
# }
 
 service { 'firewalld':
  ensure => stopped,
  enable => false,
 }
}
