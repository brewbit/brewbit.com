# -*- mode: ruby -*-
# vi: set ft=ruby :

begin
  require 'dotenv'
  Dotenv.load '.env'
rescue LoadError; end

Vagrant.configure('2') do |config|
  config.omnibus.chef_version = :latest

  config.vm.define :brewbit do |brewbit|
    brewbit.ssh.username = 'vagrant'
    brewbit.vm.hostname = 'brewbit'
    brewbit.vm.box = 'digital_ocean'
    brewbit.vm.box_url = "https://github.com/smdahlen/vagrant-digitalocean/raw/master/box/digital_ocean.box"
    brewbit.ssh.private_key_path = '~/.ssh/brewbit'
  end

  config.vm.provider :digital_ocean do |provider, override|
    provider.client_id = ENV['DIGITAL_OCEAN_CLIENT_ID']
    provider.api_key = ENV['DIGITAL_OCEAN_API_KEY']
    provider.image = 'Ubuntu 13.04 x64'
    provider.region = 'San Francisco 1'
    provider.size = '1GB'
    provider.private_networking = false
    provider.backups_enabled = false
    provider.ssh_key_name = 'Vagrant'
    provider.setup = true
  end

  config.vm.provision :chef_solo do |chef|

    chef.cookbooks_path = ['cookbooks', 'site-cookbooks']
    chef.data_bags_path = 'data_bags'
    chef.encrypted_data_bag_secret_key_path = "#{ENV['HOME']}/.chef/encrypted_data_bag_secret"

    chef.add_recipe 'chef-solo-search'
    chef.add_recipe 'users'
    chef.add_recipe 'locale'
    chef.add_recipe 'apt'
    chef.add_recipe 'build-essential'
    chef.add_recipe 'postgresql::server'
    chef.add_recipe 'postgresql::libpq'
    chef.add_recipe 'cmake'
    chef.add_recipe 'libqt4'
    chef.add_recipe 'imagemagick'
    chef.add_recipe 'rvm::vagrant'
    chef.add_recipe 'rvm::system'
    chef.add_recipe 'brewbit'

    chef.json = {
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
        'users' => [
          {
            'username' => 'brewbit',
            'password' => 'brewbit',
            'superuser' => false,
            'createdb' => true,
            'login' => true
          },
          {
            'username' => 'vagrant',
            'password' => 'vagrant',
            'superuser' => true,
            'createdb' => true,
            'login' => true
          }
        ],
        "databases" => [
          {
            "name" => "brewbit_production",
            "owner" => "brewbit",
            "template" => "template0",
            "encoding" => "utf8",
            "locale" => "en_US.UTF8"
          }
        ]
      }
    }
  end
end

