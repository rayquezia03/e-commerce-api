Rails.application.routes.draw do
  root 'products#index'

  devise_for :users

  resources :products, only: [:index, :show]
  resource :cart, only: [:show, :update]
  resources :orders, only: [:new, :create]
  post '/cart/add', to: 'carts#add', as: :cart_add

  resources :orders, only: [:create, :show]

  Rails.application.routes.draw do
    resources :carts do
      post 'finalize', on: :member, to: 'carts#finalize', as: 'finalize_cart'
    end
  
    # Outras rotas
  end

  Rails.application.routes.draw do
    # Definindo a rota para adicionar ao carrinho
    post 'add_item_cart', to: 'carts#add_item', as: 'add_item_cart'
    # Outras rotas...
  end

  Rails.application.routes.draw do
    resources :carts, only: [:show] do
      member do
        patch :update_item  # Isso vai gerar o update_cart_item_path
        delete :remove_item # Isso vai gerar o remove_item_cart_path
      end
    end
  
    # Outras rotas
  end 

  get 'checkout', to: 'orders#new', as: 'checkout'
  
  resources :documents, only: [:new, :create] do
    collection do
      get 'export', to: 'documents#export', as: 'export'
    end
  end

  resources :reports, only: [:index] do
    collection do
      delete 'reset_database', to: 'reports#reset_database'
    end
  end

  get 'about_me', to: 'pages#about_me'
end