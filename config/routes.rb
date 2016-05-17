Rails.application.routes.draw do

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "users", only: [:create, :index, :show, :edit, :update] do
    collection do
      post "friendship"
      post "player"
      put "acceptance"
      put "denial"
    end
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "users#new", as: "sign_up"
  resources :characters do
    member do
      delete "player"
    end
  end
  resources :equipment do
    member do
      get "character"
      post "char_equip"
      post "game_equip"
    end
  end
  resources :skills
  resources :stats
  resources :sheet_templates do
    member do
      get "grabber"
      post "game_sheet"
    end
  end
  resources :game_sessions
  resources :messages do
    member do
      get "session_messages"
    end
  end

  get '/about', to: 'dashboard#about'
  root 'dashboard#index'

end
