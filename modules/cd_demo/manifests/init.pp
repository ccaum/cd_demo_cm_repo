class cd_demo {
  include git

  package { 'json':
    ensure   => installed,
    provider => gem,
  }

  file { '/etc/puppet/environments':
    ensure => directory,
  }

  file { '/etc/puppet/environments.json':
    ensure => file,
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
