# puppet nginx server configurator

package { 'nginx':
  ensure => installed,
}

service { 'nginx':
  ensure  => running,
  enable  => true,
  require => Package['nginx'],
}

file { '/var/www/html/index.nginx-debian.html':
  ensure  => present,
  content => 'Hello World!',
  require => Package['nginx'],
}

file { '/etc/nginx/sites-available/default':
  ensure  => present,
  content => template('./default_block.erb'),
  require => Package['nginx'],
  notify  => Service['nginx'],
}

exec { 'nginx-restart':
  command     => '/bin/systemctl restart nginx',
  refreshonly => true,
  subscribe   => [
    File['/var/www/html/index.nginx-debian.html'],
    File['/etc/nginx/sites-available/default'],
  ],
}
