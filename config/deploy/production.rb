
set :application, 'brewbit.com'

set :rails_env, 'production'

# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary
# server in each group is considered to be the first
# unless any hosts have the primary property set.
# Don't declare `role :all`, it's a meta role
role :app, %w{deploy@brewbit.com}
role :web, %w{deploy@brewbit.com}
role :db,  %w{deploy@brewbit.com}

# Default deploy_to directory is /var/www/my_app
set :deploy_to, "/var/www/brewbit.com"

# Default value for default_env is {}
set :default_env, { rails_env: 'production' }

# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server
# definition into the server list. The second argument
# something that quacks like a hash can be used to set
# extended properties on the server.
server 'brewbit.com',
  user: 'deploy',
  roles: %w{web app db},
  ssh_options: {
    keys: %w(~/.ssh/brewbit ~/.ssh/id_rsa),
    forward_agent: true,
    auth_methods: %w(publickey)
  }

# you can set custom ssh options
# it's possible to pass any option but you need to keep in mind that net/ssh understand limited list of options
# you can see them in [net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start)
# set it globally
#  set :ssh_options, {
#    keys: %w(/home/rlisowski/.ssh/id_rsa),
#    forward_agent: false,
#    auth_methods: %w(password)
#  }
# and/or per server
# server 'brewbit.com',
#   user: 'user_name',
#   roles: %w{web app},
#   ssh_options: {
#     user: 'user_name', # overrides user setting above
#     keys: %w(/home/user_name/.ssh/id_rsa),
#     forward_agent: false,
#     auth_methods: %w(publickey password)
#     # password: 'please use keys'
#   }
# setting per server overrides global ssh_options
