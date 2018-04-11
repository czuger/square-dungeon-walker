Rails.application.routes.draw do
  resources :dungeon_instances, except:[ :edit, :update ] do
    patch :clear_room
    patch :move
    get :play
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'dungeon_instances#index'
end
