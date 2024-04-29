# puppet nginx server configurator

package { 'nginx':
  ensure => installed,
}

file { '/etc/nginx/conf.d/custom_http_header.conf':
  ensure  => present,
  content => "add_header X-Served-By \$hostname;\n",
  notify  => Service['nginx'],
}

service { 'nginx':
  ensure  => running,
  enable  => true,
  require => File['/etc/nginx/conf.d/custom_http_header.conf'],
}