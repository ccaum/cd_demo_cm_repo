class jenkins_plugins::jobs {
  file { '/var/lib/jenkins/jobs':
    ensure   => directory,
    recurse  => true,
    purge    => true,
    source   => 'puppet:///modules/jenkins_plugins/jobs',
    owner    => jenkins,
    group    => jenkins,
    notify   => Class['jenkins::service'],
  }

  file { '/var/lib/jenkins/.gitconfig':
    ensure => file,
    source => 'puppet:///modules/jenkins_plugins/gitconfig',
  }
}
