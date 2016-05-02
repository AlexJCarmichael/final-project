Rails.application.routes.draw do

  resources :characters
  resources :equipment
  resources :skills
  resources :sheet_templates
  resources :game_sessions
  root 'welcome#index'

end
