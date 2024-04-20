# puppet config for ssh

file_line {'disable pass auth':
  path  => '/etc/ssh/sshd_config'
  line  => 'PasswordAuthentication no'
  match => ''

}