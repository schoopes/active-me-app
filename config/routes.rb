Rails.application.routes.draw do

  namespace :api do
    get "/users/me" => "users#profile"
    get "/users/:id" => "users#show"
    post "/users" => "users#create"
    patch "/users/:id" => "users#update"
    delete "/users/:id" => "users#destroy"

    post "/sessions" => "sessions#create"

    get "/favorites" => "favorites#index"
    post "/favorites" => "favorites#create"
    delete "/favorites/:id" => "favorites#destroy"

    get "/eventful" => "eventful#index"

  end

  get "/users/:id" => "users#show"
  get "/users/new" => "users#new"
  post "/users" => "users#create"
  get "/users/:id/edit" => "users#edit"
  delete "/users/:id" => "users#destroy"

end
