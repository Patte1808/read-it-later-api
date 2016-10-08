Rails.application.routes.draw do
  devise_for :users
  post 'auth_user' => 'authentication#authenticate_user'
  resources :links
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
