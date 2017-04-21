Rails.application.routes.draw do
  resource :session, only: [:create, :new, :destroy]

  resource :user, only: [:show, :new, :create]

  resources :albums, only: [:create, :destroy, :edit, :show, :update]

  resources :tracks, only: [:create, :destroy, :edit, :show, :update]

  resources :notes, only: [:create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
