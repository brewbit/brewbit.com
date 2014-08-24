Spree::Core::Engine.routes.draw do
  get '/privacy', to: 'static#privacy'
  get '/backers', to: 'static#backers'
  get '/model-t', to: 'static#model_t'
  
  namespace 'admin' do
    resources :firmware, only: [:index, :create, :destroy, :new] do
      get 'serve', on: :member
    end

    resources :devices, only: :index
    
    resources :reports do
      collection do
        get :ca_sales_total
        post :ca_sales_total
      end
    end
  end
end
