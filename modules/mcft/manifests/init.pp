class mcft {

 package {'java-17-openjdk':
  ensure => installed
 }
 
 file {'/opt/minecraft':
  ensure => directory
 }
 
 file {'/opt/minecraft/eula.txt':
   content => '',
   ensure => file,
   source => 'puppet:///modules/minecraft/eula.txt'
 }
}
