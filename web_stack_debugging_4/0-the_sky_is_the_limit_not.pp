# 0-the_sky_is_the_limit_not.pp
exec { 'fix--for-nginx':
  command => 'sed -i "s/15/4096/" /etc/default/nginx && nginx -s reload',
  path    => '/usr/local/bin/:/bin/:/usr/bin/'
}

