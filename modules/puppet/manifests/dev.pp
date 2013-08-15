class puppet::dev {
  require ruby::dev

  package { 'libxslt-devel':
    ensure => installed,
  }
 
  package { 'libxml2-devel':
    ensure => installed,
  }

  package { 'rspec-system':
    provider => gem,
    require  => Package['libxml2-devel','libxslt-devel'],
  }

  package { 'puppetlabs_spec_helper':
    provider => gem,
    require  => Package['libxml2-devel','libxslt-devel'],
  }
}
