Rails.application.routes.draw do
  root 'inicial#index'
  get 'inicial/index'

  resources :kinds
  resources :contacts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
