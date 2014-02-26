

# Developmpent

## DigitalOcean

* Install the DigitalOcean SSH keys to ~/.ssh/brewbit and ~/.ssh/brewbit.pub
* Install the Chef encrypted data bag key to ~/.chef/encrypted_data_bag_secret
* Add the following to your ~/.bashrc:
```bash
export DIGITAL_OCEAN_CLIENT_ID=<snip>
export DIGITAL_OCEAN_API_KEY=<snip>
```
* Install [Vagrant](http://www.vagrantup.com/)
* Install Vagrant plugins
```bash
vagrant plugin install vagrant-digitalocean
vagrant plugin install vagrant-librarian-chef
vagrant plugin install vagrant-omnibus
```
* Bring up the droplet on DigitalOcean
```bash
vagrant up --provider=digital_ocean
```
* Deploy the site to the droplet
```bash
cap production deploy
```

* ... On server... TODO AUTOMATE THIS!!!
```bash
export RAILS_ENV=production
# load seed data to database
rake db:seed
# create additional admin users (if needed)
rake spree_auth:admin:create
# start the app servers
bundle exec unicorn_rails -c config/unicorn.rb -D
```

Server is now accessible on `http://brewbit.com`

