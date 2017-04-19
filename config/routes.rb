Rails.application.routes.draw do
  resources :addresses
  resources :users do
    resources :addresses
  end

  root 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
