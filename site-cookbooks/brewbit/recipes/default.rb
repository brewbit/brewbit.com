# Decrypt 3rd party service API keys
tumblr = Chef::EncryptedDataBagItem.load("secrets", "tumblr")
mailchimp = Chef::EncryptedDataBagItem.load("secrets", "mailchimp")

template ".env" do
  source "env.erb"
  mode 0640
  owner "root"
  group "root"
  variables({
     :tumblr => tumblr,
     :mailchimp => mailchimp
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

