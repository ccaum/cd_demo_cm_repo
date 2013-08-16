class corpapp::testing {
  file { '/etc/xinetd.d/git':
    source => 'puppet:///modules/corpapp/git.xinetd',
    notify => Service['xinetd'],
  }

  service { 'xinetd':
    ensure => running,
    enable => true,
  }

  file { '/root/reset-certs.sh':
    source => 'puppet:///modules/corpapp/reset-certs.sh',
    owner  => 0,
    group  => 0,
    mode   => 0755,
  }

  ssh_authorized_key { 'root jenkins key':
    ensure => present,
    key    => 'AAAAB3NzaC1yc2EAAAABIwAAAQEAsrIQ1Z4GQ9v5/Vi5HW4HQydd/P1L0QFZbqTsxOBbjwEDUrnsbOqAwnUFRYZSMSfbmgqq17Pt+tuFeSFCeprERcaXMJy/6pYIOu1yabBErfNqHIH4jPaJtMp0dhrPSnR8oG1J6k6VnL9+auZpUVR192qY7TqkspTboxjz6Yrm9v0QJI8mbwnvizs2hpeoXVqTm09Q4l7z5VVznL48kQkNxFfcYQZbhqhC+2jScOD2dd0jFGUP6PGxOPZoG2TBDRhavGNVQ/7614p1mufOENs5UkRPe5C36fTZBZFpQl9AuFsqDMq6Yipm2xxG1ax8nO1fGajkwOPtC4pS2/MYoEKdjQ==',
    user   => root,
    type   => 'ssh-rsa',
  }

  file { 'root private ssh key':
    path   => '/root/.ssh/id_rsa',
    source => 'puppet:///modules/corpapp/id_rsa',
    owner  => 0,
    group  => 0,
    mode   => 0600,
  }

  file { 'root private ssh public key':
    path   => '/root/.ssh/id_rsa.pub',
    source => 'puppet:///modules/corpapp/id_rsa.pub',
    owner  => 0,
    group  => 0,
    mode   => 0600,
  }

  file { '/var/lib/jenkins/.ssh':
    ensure => directory,
    owner  => jenkins,
    group  => jenkins,
    mode   => 700,
  }

  file { 'jenkins private ssh key':
    path   => '/var/lib/jenkins/.ssh/id_rsa',
    source => 'puppet:///modules/corpapp/id_rsa',
    owner  => jenkins,
    group  => jenkins,
    mode   => 0600,
  }

  file { 'jenkins private ssh public key':
    path   => '/var/lib/jenkins/.ssh/id_rsa.pub',
    source => 'puppet:///modules/corpapp/id_rsa.pub',
    owner  => jenkins,
    group  => jenkins,
    mode   => 0600,
  }
}
