node 'slave1.puppet'{
  include slave1_init
}

node 'slave2.puppet'{
  include slave2_init
}
  
node 'master.puppet' {
 include master_init
}

node 'mincraft.puppet' {
 include mcft_init
}

