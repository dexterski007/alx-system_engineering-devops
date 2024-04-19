# puppet manifest for installing a package
exec { 'install_flask':
  command     => 'pip3 install flask==2.1.0',
}
