Rails.application.routes.draw do
  root 'products#index'

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }

  resources :products, only: [:index, :show]

  resource :cart, only: [:show, :update, :delete] do
    post 'add_item', to: 'carts#add_item', as: 'add_item_cart'
    post 'finalize', on: :member, to: 'carts#finalize', as: 'finalize_cart'
    member do
      patch :update_item   
      delete 'remove_item', to: 'carts#remove_item'
    end
  end

  resources :orders, only: [:new, :create, :show] do
    get 'checkout', on: :collection, to: 'orders#new', as: 'checkout'
  end

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