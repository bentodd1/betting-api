Rails.application.routes.draw do
  resources :user_accounts
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
  get "account/self", to: "user_accounts#self"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
