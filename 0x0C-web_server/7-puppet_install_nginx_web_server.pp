# puppet nginx server configurator

package {'nginx':
  ensure => installed;
}

service {'nginx':
  require => Package['nginx'];
  ensure  => running;
  enable  => true;
}

exec {'create homepage':
  command => 'echo "Hello World!" > /var/www/html/index.nginx-debian.html';
  path    => ['/bin', '/usr/bin'];
}

exec {'create redirection':
  command => 'sed -i '/listen 80 default_server;/a rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;' /etc/nginx/sites-available/default';
  path    => ['/bin', '/usr/bin'];
}

exec {'reboot':
  command => 'systemctl restart nginx';
  path    => ['/bin', '/usr/bin'];
}
