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
 
 file {'/opt/minecraft/':
  source => 'file:///vagrant/minecraft_server.jar',
 }
}
