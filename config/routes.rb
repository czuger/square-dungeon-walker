Rails.application.routes.draw do
  resources :dungeon_instances, except:[ :edit, :new ]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'dungeon_instances#index'
end
