Rails.application.routes.draw do
  resources :addresses
  root 'inicial#index'
  get 'inicial/index'

  resources :kinds
  resources :contacts
  resources :phones
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
