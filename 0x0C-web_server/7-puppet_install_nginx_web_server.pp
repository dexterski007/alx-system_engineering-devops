# puppet nginx server configurator

class setup_nginx {
  package { 'nginx':
    ensure  => installed,
  }

  service { 'nginx':
    ensure  => 'running',
    enable  => true,
    require => Package['nginx'],
  }

  nginx::resource::server { 'default_server':
    listen_port => 80,
    server_name => '_',
  }

  nginx::resource::location { 'default_server_redirect':
    ensure          => present,
    location        => '/redirect_me/',
    server          => 'default_server',
    location_config => {
      'return' => '301 https://www.theroom.com/;',
    },
    require         => Nginx::Resource::Server['default_server'],
  }

  file { '/usr/share/nginx/html/index.html':
    ensure  => present,
    content => 'Hello World!',
    require => Package['nginx'],
  }
}

include setup_nginx
