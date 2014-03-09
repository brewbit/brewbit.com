Spree::Core::Engine.add_routes do
  get '/blog',           to: 'blog#index'
  get '/blog/:id/:slug', to: 'blog#show'
end