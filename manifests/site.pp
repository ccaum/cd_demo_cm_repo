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
  include activemq
  include corpapp::testing

  Class['java'] -> Class['activemq'] -> Class['mcollective']
}

node /mysql-.*\.vagrant\.internal/ {
  include corpapp::db
  include mcollective
}

node /corpsite-.*\.vagrant\.internal/ {
  include corpapp
  include mcollective
}
