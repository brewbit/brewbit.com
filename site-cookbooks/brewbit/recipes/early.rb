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

directory "/var/log/brewbit.com" do
  owner "deploy"
  group "deploy"
  mode 02775
  recursive true
end

# Create the dotenv file containing secrets
template "/var/www/brewbit.com/shared/.env" do
  source "env.erb"
  mode 0640
  owner "deploy"
  group "deploy"
  variables({
     :tumblr => Chef::EncryptedDataBagItem.load("secrets", "tumblr"),
     :mailchimp => Chef::EncryptedDataBagItem.load("secrets", "mailchimp"),
     :aws => Chef::EncryptedDataBagItem.load("secrets", "aws")
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
