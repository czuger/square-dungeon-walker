Rails.application.routes.draw do

  resources :dungeon_instances, except:[ :edit, :update ] do
    patch :clear_room
    patch :move
    get :play
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resource :sessions, only: [:new]

  root 'sessions#new'

  # get '/auth/:provider/callback', to: 'sessions#create'
  # post '/auth/:provider/callback', to: 'sessions#create'
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: 'sessions#failure', via: [:get, :post]

end
