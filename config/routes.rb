Rails.application.routes.draw do
  resources :user_bets
  resources :betting_scenarios
  resources :game_statuses
  resources :games
  resources :leagues
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
