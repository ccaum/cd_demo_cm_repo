class corpapp::db {
  require mysql::server

  $db_user     = hiera('wordpress::db_user')
  $db_password = hiera('wordpress::db_password')
  $wordpress_directory = hiera('wordpress::install_dir')

  file { $wordpress_directory:
    ensure => directory,
  }

  file { "${wordpress_directory}/import.sql":
    ensure => file,
    source => 'puppet:///modules/corpapp/import.sql',
  }

  mysql::db { 'wordpress':
    user     => $db_user,
    password => $db_password,
    host     => "%",
    grant    => ['all'],
    sql      => "${wordpress_directory}/import.sql",
    require  => File["${wordpress_directory}/import.sql"],
  }
}
