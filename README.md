

# Developmpent

## Vagrant

* Install [Vagrant](http://www.vagrantup.com/)
* Install dependenices
```bash
vagrant plugin install vagrant-librarian-chef
vagrant plugin install vagrant-omnibus
```
* Bring up the vagrant machine
```bash
vagrant up --provider=digital_ocean
# wait for the machine to be built
vagrant ssh
```
* Install the gems and set up the database
```bash
cd /vagrant
bundle install
rake db:create
rake db:migrate
rake db:seed
rake spree_auth:admin:create
```
* Start the servers
```bash
foreman start
```

Server is now accessible on `http://localhost:3000`

