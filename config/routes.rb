Rails.application.routes.draw do
  root 'inicial#index'
  get 'inicial/index'
  get 'contacts/busca' => 'contacts#busca', as: :busca_contact

  resources :kinds
  resources :contacts
  get 'contact/novo' => 'contacts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
