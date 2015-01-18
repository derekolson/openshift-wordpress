# Install latest Wordpress

class wordpress::install {

  # Create the Wordpress database
  exec { 'create-database':
    unless  => '/usr/bin/mysql -u root -pvagrant wordpress',
    command => '/usr/bin/mysql -u root -pvagrant --execute=\'create database wordpress\'',
  }

  exec { 'create-user':
    unless  => '/usr/bin/mysql -u wordpress -pwordpress wordpress',
    command => '/usr/bin/mysql -u root -pvagrant --execute="GRANT ALL PRIVILEGES ON wordpress.* TO \'wordpress\'@\'localhost\' IDENTIFIED BY \'wordpress\'"',
  }

  # Get a new copy of the latest wordpress release
  # FILE TO DOWNLOAD: http://wordpress.org/latest.tar.gz
  # $wp_version = "4.1"
  # $wp_download = "wordpress-${wp_version}.tar.gz"
  $wp_download = "latest.tar.gz"
  exec { "download-wordpress":
    command => "/usr/bin/wget http://wordpress.org/${wp_download}",
    cwd     => "/vagrant/",
    creates => "/vagrant/${wp_download}"
  }

  exec { "untar-wordpress":
    cwd     => "/vagrant/",
    command => "/bin/tar xzvf /vagrant/${wp_download}",
    require => Exec["download-wordpress"],
    creates => "/vagrant/wordpress",
  }

  # Copy a working wp-config.php file for the vagrant setup.
  file { "/vagrant/wordpress/wp-config.php":
    source => "puppet:///modules/wordpress/wp-config.php"
  }

  file { "remove-wp-download":
    path  => "/vagrant/${wp_download}",
    ensure => absent,
    require => Exec["untar-wordpress"],
  }
}
