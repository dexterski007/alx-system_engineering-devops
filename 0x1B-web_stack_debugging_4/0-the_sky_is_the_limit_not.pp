#fix for nginx multitasking
exec { 'sedscript':
  command => "sed -i 's/ULIMIT=\"-n 15\"/ULIMIT=\"-n 20000\"/g' /etc/default/nginx",
  path    => ['/usr/bin', '/usr/sbin', '/bin'],
  onlyif  => 'grep -q "ULIMIT=\"-n 15\"" /etc/default/nginx',
  notify  => Service['nginx'],
}

service { 'nginx':
  ensure    => running,
  enable    => true,
  subscribe => Exec['sedscript'],
}
