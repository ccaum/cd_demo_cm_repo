class jenkins_plugins::views {
  file { '/var/lib/jenkins/config.xml':
    source => 'puppet:///modules/jenkins_plugins/config.xml',
    owner  => jenkins,
    group  => jenkins,
    notify => Class['jenkins::service'],
  }
}
