# Seting up my client config file
augeas { 'disable password auth':
  context => '/files/etc/ssh/ssh_config',
  changes => "set *[. = 'PasswordAuthentication yes'] 'PasswordAuthentication no'",
}

augeas { 'Delare identity file':
  context => '/files/etc/ssh/ssh_config',
  changes => [
    "ins line before /files/etc/ssh/ssh_config/*[1]",
    "set /files/etc/ssh/ssh_config/*[1] 'IdentityFile ~/.ssh/school'",
  ],
}
