# Create the deploy user/group
users_manage "rvm" do
  action :create
end

# Create the application deployment directory
directory "/var/www/brewbit.com" do
  owner "deploy"
  group "deploy"
  mode 02700
  recursive true
end

%w[ /var/www/brewbit.com/releases /var/www/brewbit.com/shared ].each do |path|
  directory path do
    owner "deploy"
    group "deploy"
    mode 02775
  end
end

# Create the dotenv file containing secrets
template "/vagrant/.env" do
  source "env.erb"
  mode 0640
  owner "root"
  group "root"
  variables({
     :tumblr => Chef::EncryptedDataBagItem.load("secrets", "tumblr"),
     :mailchimp => Chef::EncryptedDataBagItem.load("secrets", "mailchimp")
  })
end

# Install SSL certificate and private key from encrypted data bag
ssl = Chef::EncryptedDataBagItem.load("secrets", "ssl")

file "/etc/ssl/certs/brewbit.com.crt" do
  owner "root"
  group "root"
  mode 0644
  content ssl['cert']
end

file "/etc/ssl/private/brewbit.com.key" do
  owner "root"
  group "ssl-cert"
  mode 0640
  content ssl['key']
end

cookbook_file "nginx__sites-enabled__brewbit.com" do
  path "/etc/nginx/sites-enabled/brewbit.com"
  action [ :delete, :create ]
end
