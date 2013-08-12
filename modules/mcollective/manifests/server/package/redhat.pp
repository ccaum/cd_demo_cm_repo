# Class: mcollective::server::package::redhat
#
#   This class installs MCollective dependency packages for Redhat.
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class mcollective::server::package::redhat(
  $version ) {

  package { 'stomp':
    provider => gem,
    before   => Package['mcollective'],
  }

  package { 'mcollective':
    ensure => $version,
  }

}

