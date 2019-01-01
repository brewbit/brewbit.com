

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


## Docker

It is possible to run a fully-local copy of the BrewBit backend services (see below for an overview) using Docker Compose.

1. Modify the database name in `config/database.yml` to read `host: db` (instead of localhost).

2. Specify a permanent storage location for the PostgreSQL data by editing `docker-compose.yml`.

3. Git clone [brewbit/brewbit-device-server](https://github.com/brewbit/brewbit-device-server). Both `brewbit.com` and `brewbit-device-server` should be located in the same directory. (The path to `brewbit-device-server` be changed in `docker-compose.yml`.)

4. Configure your router's DNS to resolve `dg.brewbit.com` to the address of your local server. This is a workaround, since the gateway server location is compiled into the [Model-T firmware](https://github.com/brewbit/model-t).

5. Launch the services using Docker Compose and instantiate the database:

```
docker-compose build
docker-compose run web rake db:create
docker-compose run web rake db:migrate
docker-compose up
```

The website will appear at [http://localhost:3000](http://localhost:3000), and you will be able to create an account and log in.


# Architecture Overview

There are three main backend services for BrewBit:

* [brewbit/brewbit-device-server](https://github.com/brewbit/brewbit-device-server) acts as an intermediary between the Model-T device and the web dashboard, so that statistics and setpoints can be exchanged back and forth. The device server speaks to the Model-T using [Protocol Buffers](https://en.wikipedia.org/wiki/Protocol_Buffers) and to the dashboard using JSON. The protobuf message formats are found in [brewbit/brewbit-protobuf-messages](https://github.com/brewbit/brewbit-protobuf-messages).

* brewbit.com (this repo) provides the website at [http://brewbit.com/](http://brewbit.com/) including the web dashboard. It persists statistics in a PostgreSQL database and communicates to the Model-T devices via the brewbit-device-server. Most of the brewing dashboard code has been extracted to the gem [brewbit/brewbit-dashboard](https://github.com/brewbit/brewbit-dashboard).

* A PostgreSQL database that holds statistics, device configurations, and even the firmware updates themselves.

The device firmware can be found at [brewbit/model-t](https://github.com/brewbit/model-t).
