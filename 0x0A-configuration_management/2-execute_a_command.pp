# puppet manifest for killing a process

exec {'kill_process':
  command   => 'pkill killmenow',
  path      => '/usr/local/bin:/usr/bin:/bin',
}
