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

exec { 'redirect':
  command => "/usr/bin/sed -i '/^}$/i \\\n\tlocation \\/redirect_me {return 301 https:\\/\\/www.youtube.com\\/watch?v=QH2-TGUlwu4;}' /etc/nginx/sites-available/default",
}
