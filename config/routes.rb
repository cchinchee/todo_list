Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "users#index"
  get "/users/:id/dashboard" => "users#dashboard", as: "users_dashboard"
  resources :users do
  	resources :tasks
  	resources :categories
  end	



  post "/users/login" => "users#login", as: "users_login"
  delete "/users/log_out" => "users#logout", as: "users_logout"

  post "/users/:user_id/tasks/:id/edit" => "tasks#edit_update", as: "tasks_update" 
end
