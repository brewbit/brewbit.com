Spree::Core::Engine.routes.draw do
  get '/sso' => 'discourse_sso#sso'
end
