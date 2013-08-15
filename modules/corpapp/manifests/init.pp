class corpapp {
  include mysql
  include mysql::php
  include apache
  include apache::mod::php
  include wordpress

  apache::vhost { 'corpapp.vagrant.internal':
    servername => 'corpapp.vagrant.internal',
    port       => 80,
    docroot    => $wordpress::install_dir,
  }

  file { "${wordpress::install_dir}/wp-content/uploads":
    ensure => directory,
    owner  => 'www-data',
    mode   => '0640',
    notify => Service['httpd'],
  }

  file { '/opt/wordpress/wp-content/uploads/2013': ensure  => directory,
    source  => 'puppet:///modules/corpapp/2013',
    recurse => true,
    owner   => 'www-data',
    group   => 0,
    notify  => Service['httpd'],
  }
}
