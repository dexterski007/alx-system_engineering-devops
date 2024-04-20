# Seting up my client config file

exec { 'sshconfig':
  path    => '/usr/bin/',
  command => 'echo "IdentityFile ~/.ssh/school\n PasswordAuthentication no" >> /etc/ssh/ssh_config',
}
