Rails.application.routes.draw do
  get "sessions/new"
  resources :user_bets
  resources :betting_scenarios
  resources :game_statuses
  resources :games
  resources :leagues
  resources :users

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
