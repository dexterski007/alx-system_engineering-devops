# puppet config for ssh

file_line {'disable pass auth':
  ensure  => present,
  path    => '/etc/ssh/sshd_config',
  line    => 'PasswordAuthentication no',
  match   => '^#?PasswordAuthentication',
  replace => true,
}
file_line {'disable pass auth':
  ensure  => present,
  path    => '/etc/ssh/ssh_config',
  line    => 'IdentityFile ~/.ssh/school',
  replace => true,
}
