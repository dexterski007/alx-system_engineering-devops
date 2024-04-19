# puppet manifest for installing a package
package { 'python3-pip':
  ensure => installed,
}

exec { 'install_flask':
  command     => 'pip3 install flask==2.1.0',
  path        => '/usr/local/bin:/usr/bin:/bin',
  refreshonly => true,
  subscribe   => Package['python3-pip'],
}
