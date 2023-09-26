Rails.application.routes.draw do
  # get 'cities/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "cities#index"
  get "city/:id/forecast", to: "cities#show", as: "city_forecast"
end
