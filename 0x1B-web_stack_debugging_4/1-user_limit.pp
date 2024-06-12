#fix for user limit
exec { 'user_limit':
  command => 'sed -i "s/holberton/#holberton/g" /etc/security/limits.conf',
  path    => ['/usr/bin', '/usr/sbin', '/bin'],
}
