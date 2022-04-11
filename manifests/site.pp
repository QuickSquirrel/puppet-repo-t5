node 'slave1.puppet'{
  include slave1_init
}
  
node 'master.puppet' {
 include master_init
}
