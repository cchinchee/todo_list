Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "users#index"
  resources :users do
  	resources :tasks
  end	

  post "/users/login" => "users#login", as: "users_login"
  delete "/users/log_out" => "users#logout", as: "users_logout"


end
