Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :events do
    resources :bookings, only: [ :new, :create]
  end
  resources :bookings, only: [ :show, :destroy ]
 
  resources :chatrooms, only: :show do
    resources :messages, only: [ :create ]
  end # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :bookings, only: [ :index, :show, :destroy, :update ]
  resources :profiles, only: [ :edit, :update ]
  resources :dashboards, only: [ :index, :show ]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
