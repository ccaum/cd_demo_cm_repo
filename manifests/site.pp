node 'mongodb.vagrant.internal' {
  include mongodb
}

node 'mongodb-staging.vagrant.internal' {
  include mongodb
}

node 'mongodb-02.vagrant.internal' {
  include mongodb
}

node 'puppetmaster.vagrant.internal' {
  include cd_demo
  include jenkins
  include jenkins_plugins
  include mcollective
  include puppet::master
  include puppetdb
  include puppetdb::master::config
  include java
  include ruby::dev
  #include passenger
  include activemq

  Class['java'] -> Class['activemq'] -> Class['mcollective']
  #Class['ruby::dev'] -> Class['passenger']
}

node 'mysql.vagrant.internal' {
  include mysql::server
}

node 'mysql-staging.vagrant.internal' {
  include mysql::server
}

node 'corpsite.vagrant.internal' {
  include corpapp
}

node 'corpsite-staging.vagrant.internal' {
  include corpapp
}
