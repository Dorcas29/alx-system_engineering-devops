# Script to install nginx using puppet

package {'nginx':
  ensure => 'installed',
}

file line {'install':
  ensure => 'present',
  path   => '/etc/nginx/sites-enabled/default',
  after  => 'listen 80 default_server;',
  line   => 'rewrite ^/redirect_me https://www.github.com/Dorcas29 permanent;',

}

file { '/var/www/html/index.html':
  content  => 'Hello World!',
}

service { 'nginx':
  ensure  => running,
  require => Package['nginx],
}
