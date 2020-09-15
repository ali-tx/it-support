Rails.application.routes.draw do
  devise_for :users
  # resources :users

  resources :articles

  root 'articles#index'
  get '/search' => 'pages#search', :as => 'search_page'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
