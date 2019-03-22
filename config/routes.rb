Rails.application.routes.draw do

  namespace :api do
    get "/sendgrid/test" => "sendgrid#test"
    get "/sendgrid/confirmation" => "sendgrid#confirmation"

    get "/users/me" => "users#profile"
    get "/users/:id" => "users#show"
    post "/users" => "users#create"
    patch "/users/:id" => "users#update"
    delete "/users/:id" => "users#destroy"

    post "/sessions" => "sessions#create"

    get "/favorites" => "favorites#index"
    post "/favorites" => "favorites#create"
    get "/favorites/:eventful_id" => "favorites#attendees"
    delete "/favorites/:eventful_id" => "favorites#destroy"

    get "/eventful" => "eventful#index"

    get "/google/authorize" => "google#google_authorize"
    get "/google/callback" => "google#google_callback"

  end

  get "/*path" => proc { [200, {}, [ActionView::Base.new.render(file: 'public/index.html')]] }

end

