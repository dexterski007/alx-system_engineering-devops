#fix for apache2 installation
exec { 'fix settings':
  path    => ['/bin', '/usr/bin'],
  command => 'sed -i "s/.phpp/.php/g" /var/www/html/wp-settings.php',
}
