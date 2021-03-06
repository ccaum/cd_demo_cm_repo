class cd_demo {
  include git

  host { 'puppet':
    ip => $ipaddress_eth1,
  }

  file { '/root/.gitconfig':
    ensure => file,
    source => 'puppet:///modules/jenkins_plugins/gitconfig',
  }

  file { '/root/.bashrc':
    ensure => file,
    source => 'puppet:///modules/cd_demo/bashrc',
  }

  exec { 'puppetdb-ssl-setup':
    path        => '/bin:/usr/sbin:/usr/bin:/usr/local/bin:/sbin',
    refreshonly => true,
    subscribe   => Class['puppetdb::server::jetty_ini'],
    before      => Service['puppetdb'],
  }

  package { 'rubygem-json':
    ensure => installed,
    before => File['/etc/puppet/rack/config.ru'],
  }

  package { 'json':
    ensure   => installed,
    provider => gem,
    before   => File['/etc/puppet/rack/config.ru'],
    require  => Class['ruby::dev'],
  }

  package { 'rack':
    ensure   => installed,
    provider => gem,
    before   => File['/etc/puppet/rack/config.ru'],
  }

  file { '/etc/puppet/environments':
    ensure => directory,
  }

  file { '/etc/puppet/environments.json':
    ensure  => file,
    replace => false,
    content => '["dev","staging","production"]',
  }

  file { '/opt/puppet':
    ensure => directory,
  }

  file { '/opt/puppet/puppet_git':
    ensure => symlink,
    target => '/vagrant/demo_repo',
  }

  file { '/opt/puppet/cd-prototype':
    ensure => symlink,
    target => '/vagrant',
  }
}
