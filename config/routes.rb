Rails.application.routes.draw do

  root "welcome#index"
  get "/users" => "users#index"

  get "/profile/:id" => "users#profile"

  resources :blogs do
    resources :comments
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
