#fix for nginx multitasking
exec { 'sedscript':
  command => 'sed -i "s/worker_processes 4;/worker_processes 10;/g" /etc/nginx/nginx.conf',
  path    => ['/usr/bin', '/usr/sbin', '/bin'],
  onlyif  => 'grep -q "worker_processes 4;" /etc/nginx/nginx.conf',
  notify  => Service['nginx'],
}

service { 'nginx':
  ensure    => running,
  enable    => true,
  subscribe => Exec['sedscript'],
}
