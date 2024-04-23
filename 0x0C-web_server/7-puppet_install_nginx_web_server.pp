# puppet nginx server configurator

exec {'update':
  provider => shell,
  path     => '/usr/bin:/usr/sbin:/bin',
  command  => 'sudo apt-get -y update',
}

exec {'install':
  provider => shell,
  path     => '/usr/bin:/usr/sbin:/bin',
  command  => 'sudo apt-get -y install nginx',
}

exec {'hello_world':
  provider => shell,
  path     => '/usr/bin:/usr/sbin:/bin',
  command  => 'sudo echo "Hello World!" | sudo tee /var/www/html/index.nginx-debian.html',
}

exec {'redirection':
  command  => 'sudo sed -i "/server_name _;/ a\\\trewrite ^/redirect_me http://www.theroom.com permanent;" /etc/nginx/sites-available/default',
  provider => shell,
  path     => '/usr/bin:/usr/sbin:/bin',
}

exec {'starting':
  command  => 'sudo service nginx start',
  provider => shell,
  path     => '/usr/bin:/usr/sbin:/bin',
}
