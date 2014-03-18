source 'https://rubygems.org'

#ruby=2.1.0
#ruby-gemset=brewbit-spree

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.3'

# Use postgresql as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails', '~> 3.1.0'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# Gibbon is an API wrapper for MailChimp's API https://github.com/amro/gibbon
gem 'gibbon'

# Rack HTTP server for fast clients and Unix http://unicorn.bogomips.org/
gem 'unicorn'

# A fast and very simple Ruby web server http://code.macournoyer.com/thin/
gem 'thin', group: :development

# Loads environment variables from `.env`. https://github.com/bkeepers/dotenv
gem 'dotenv-rails'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# knife-solo adds a handful of Knife commands that aim to make working with chef-solo as powerful as chef-server.
gem 'knife-solo', group: :development

# A knife plugin to make working with data bags easier in a chef solo environment.
gem 'knife-solo_data_bag', group: :development

# Librarian-Chef is a bundler for your Chef-based infrastructure repositories.
gem 'librarian-chef', group: :development

# Use Capistrano for deployment
gem 'capistrano', group: :development
gem 'capistrano-rvm', group: :development
gem 'capistrano-bundler', group: :development
gem 'capistrano-rails', group: :development

# Spree web store
gem 'spree', '2.2.0'
gem 'spree_gateway', :git => 'https://github.com/spree/spree_gateway.git', :branch => '2-2-stable'
gem 'spree_auth_devise', :git => 'https://github.com/spree/spree_auth_devise.git', :branch => '2-2-stable'
gem 'spree_bootstrap_frontend', :git => 'https://github.com/brewbit/spree_bootstrap_frontend.git', :branch => '2-2-stable'
gem 'spree_brewbit', :path => 'engines/spree_brewbit'
gem 'spree_tumblr', :path => 'engines/spree_tumblr'
gem 'spree_brewbit_dashboard', :path => 'engines/spree_brewbit_dashboard'
