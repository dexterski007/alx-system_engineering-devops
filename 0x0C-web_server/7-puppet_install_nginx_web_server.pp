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

exec { 'nginx-redirect':
  command => '/bin/sed -i "/listen 80 default_server;/a rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;" /etc/nginx/sites-available/default',
}

exec { 'nginx-restart':
  command     => '/bin/systemctl restart nginx',
  refreshonly => true,
  subscribe   => File['/var/www/html/index.nginx-debian.html'],
}

exec { 'nginx-restart':
  command     => '/bin/systemctl restart nginx',
  refreshonly => true,
  subscribe   => File['/etc/nginx/sites-available/default'],
}
