Rails.application.routes.draw do

  resources :game_sessions
  root 'welcome#index'

end
