Rails.application.routes.draw do
  resources :addresses do
    collection { post :import }
  end
  resources :users do
    resources :addresses
    collection { post :import }
  end

  root 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
