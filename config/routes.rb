Rails.application.routes.draw do

  namespace :api do
    post "/users" => "users#create"

    post "/sessions" => "sessions#create"

    post "/calendars" => "calendars#create"

    post "/events" => "events#create"

    get "/vm_events" => "vm_events#index"
  end
end
