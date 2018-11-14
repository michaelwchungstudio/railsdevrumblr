Rails.application.routes.draw do

  root "welcome#index"
  get "/users" => "users#index"

  get "/profile/:id" => "users#profile", :as => :user_profile
  get "/blogs/:id/editfromblog" => "blogs#editfromblog", :as => :edit_from_blog_page
  patch "/blogs/:id/updatefromblog" => "blogs#updatefromblog"

  resources :blogs do
    resources :comments
  end

  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
