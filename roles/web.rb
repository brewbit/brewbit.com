name "web"
description "Web server for brewbit.com"

run_list 'recipe[chef-solo-search]',
         'recipe[users]',
         'recipe[locale]',
         'recipe[apt]',
         'recipe[brewbit::early]',
         'recipe[build-essential]',
         'recipe[postgresql::server]',
         'recipe[postgresql::libpq]',
         'recipe[brewbit::db]',
         'recipe[cmake]',
         'recipe[libqt4]',
         'recipe[imagemagick]',
         'recipe[nginx::source]',
         'recipe[rvm::vagrant]',
         'recipe[rvm::system]',
         'recipe[brewbit::late]'
         
default_attributes(
  'locale' => {
    'lang' => 'en_US.utf8',
    'lc_all' => 'en_US.utf8'
  },
  'rvm' => {
    'rubies'       => ['2.1.0'],
    'default_ruby' => '2.1.0',
    'global_gems'  => [
      {'name'    => 'bundler', 'version' => '1.5.3'},
      {'name'    => 'rake', 'version' => '10.1.0'},
      {'name'    => 'backup', 'version' => '4.0.1' },
      {'name'    => 'pry' }
    ],
    'vagrant' => {
      'system_chef_solo' => '/opt/chef/bin/chef-solo'
    },
    'group_users' => ['vagrant'],
  },
  'postgresql' => {
    'version' => '9.3',
    'apt_distribution' => 'precise',
  },
  "nginx" => {
    "version" => "1.4.7",
    "source" => {
      "use_existing_user" => true,
    },
    "init_style" => "upstart",
    "user" => "deploy",
    "worker_processes" => 3,
    "pid" => "/var/run/nginx.pid",
    "worker_connections" => 1024,
    "multi_accept" => "on",
    "types_hash_bucket_size" => 512,
    "types_hash_max_size" => 2048,

    "sendfile" => "on",
    # "tcp_nopush" => on,
    # "tcp_nodelay" => off,

    "log_dir" => "/var/log/nginx",

    "gzip" => "on",
    "gzip_disable" => "msie6",

    "gzip_proxied" => "any",
    "gzip_min_length" => 500,
    "gzip_types" => [ "text/plain", "text/css", "application/json", "application/x-javascript",
                      "text/xml", "application/xml", "application/xml+rss", "text/javascript" ],
  }
)
