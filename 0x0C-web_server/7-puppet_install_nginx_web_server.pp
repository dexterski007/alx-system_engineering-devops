# puppet nginx server configurator

exec {'install nginx':
  provider => shell,
  command  => 'sudo apt-get -y update';
}
