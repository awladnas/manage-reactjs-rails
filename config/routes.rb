Rails.application.routes.draw do
  resources :posts
  get 'pages/index'

  root "pages#index"
  resources :comments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
