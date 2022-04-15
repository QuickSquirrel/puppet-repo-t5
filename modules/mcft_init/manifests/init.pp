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
}





 file {'/etc/systemd/system/minecraft.service':
   ensure => file,
   source => 'puppet:///modules/minecraft/minecraft.service'
   }
 ~> service { 'minecraft':
        ensure => running,
        enable => true
   }
}
