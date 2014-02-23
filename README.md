

# Developmpent

* Create a .env file with the following items:
```
DIGITAL_OCEAN_CLIENT_ID=<snip>
DIGITAL_OCEAN_API_KEY=<snip>
MAILCHIMP_API_KEY=<snip>
MAILCHIMP_LIST_ID=<snip>
TUMBLR_API_KEY=<snip>
TUMBLR_POST_URL=http://api.tumblr.com/v2/blog/brewbit.tumblr.com/posts/text
```

## Vagrant

* Install the brewbit.com SSL key and certificate to /etc/ssl/private/brewbit.com.key and /etc/ssl/certs/brewbit.com.crt
* Install the DigitalOcean SSH keys to ~/.ssh/brewbit and ~/.ssh/brewbit.pub
* Install [Vagrant](http://www.vagrantup.com/)
* Install dependenices
```bash
vagrant plugin install vagrant-digitalocean
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
# install the required gems
bundle install
# create the database
rake db:create
# create/update tables
rake db:migrate
# load seed data to database
rake db:seed
# create additional admin users
rake spree_auth:admin:create
```
* Start the servers
```bash
foreman start
```

Server is now accessible on `http://<droplet_ip>:3000`

