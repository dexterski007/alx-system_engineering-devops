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
  content => "Hello World!",
  require => Package['nginx'],
}

file { '/etc/nginx/sites-available/default':
  ensure  => 'present',
  content => "
server {
    listen 80 default_server;
    listen [::]:80 default_server;
    add_header X-Served-By $hostname;
    root /var/www/html;

    index index.html index.htm index.nginx-debian.html;

    server_name _;

    location / {
        try_files \$uri \$uri/ =404;
    }
}
",
  notify  => Exec['nginx-restart'],
}

exec { 'nginx-restart':
  command     => '/bin/systemctl restart nginx',
  subscribe   => [
  File['/etc/nginx/sites-available/default'],
  File['/var/www/html/index.nginx-debian.html'],
],
}
