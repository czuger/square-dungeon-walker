Rails.application.routes.draw do

  # resources :users, only: [] do
    resources :dungeon_instances, except:[ :edit, :update ] do
      patch :clear_room
      patch :move
      get :play
    end
  # end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'sessions#new'

  get '/auth/:provider/callback', to: 'sessions#create'
  post '/auth/:provider/callback', to: 'sessions#create'

end
