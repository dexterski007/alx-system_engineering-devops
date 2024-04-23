# puppet nginx server configurator

include nginx
class setup_nginx {
  package { 'nginx':
    ensure  => installed,
  }
}

service { 'nginx':
  ensure  => 'running',
  enable  => true,
}

nginx::resource::server { 'bmworks.tech':
  listen_port => 80,
}

file { '/usr/share/nginx/html/index.html':
  ensure  => present,
  content => 'Hello World',
}

nginx::resource::location { 'bmworks.tech/redirect_me/':
  ensure          => present,
  location        => '/redirect_me/',
  server          => 'bmworks.tech',
  location_config => {
    'return' => '301 https://www.theroom.com/;',
  },
}
