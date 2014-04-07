Spree::Core::Engine.routes.draw do
  get '/privacy', to: 'static#privacy'
  get '/backers', to: 'static#backers'
end
