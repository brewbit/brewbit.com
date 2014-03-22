# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.omnibus.chef_version = :latest
  
  env = nil

  config.vm.define :staging do |staging|
    staging.vm.hostname = 'staging.brewbit.com'
    env = 'staging'
  end

  config.vm.define :production do |production|
    production.vm.hostname = 'brewbit.com'
    env = 'production'
  end

  config.vm.provider :digital_ocean do |provider, override|
    override.ssh.username = 'vagrant'
    override.vm.box = 'digital_ocean'
    override.vm.box_url = "https://github.com/smdahlen/vagrant-digitalocean/raw/master/box/digital_ocean.box"
    override.ssh.private_key_path = '~/.ssh/brewbit'
    
    provider.client_id = ENV['DIGITAL_OCEAN_CLIENT_ID']
    provider.api_key = ENV['DIGITAL_OCEAN_API_KEY']
    provider.image = 'Ubuntu 13.04 x64'
    provider.region = 'San Francisco 1'
    provider.size = '2GB'
    provider.private_networking = false
    provider.backups_enabled = false
    provider.ssh_key_name = 'Vagrant'
    provider.setup = true
  end

  config.vm.provision :chef_solo do |chef|
    chef.roles_path = 'roles'
    chef.environments_path = 'environments'
    chef.cookbooks_path = ['cookbooks', 'site-cookbooks']
    chef.data_bags_path = 'data_bags'
    chef.encrypted_data_bag_secret_key_path = "#{ENV['HOME']}/.chef/encrypted_data_bag_secret"

    chef.environment = 'staging'
    chef.add_role 'web'
  end
end

