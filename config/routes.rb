Rails.application.routes.draw do
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :customers
  resources :books
  resources :usages, only: [:index, :create, :destroy]
  resources :courses, only: [:index, :create, :destroy]
  resources :tablenumbers, only: [:index, :create, :destroy]
  root :to => "homes#top"
  get "/about" => "homes#about"

  #顧客検索
  get 'search' => 'customers#search'
  # get ''
end
