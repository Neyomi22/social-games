Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :events do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:show, :destroy]
 
  resources :chatrooms, only: :show do
    resources :messages, only: [:create]
  end # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :profiles, only: [:edit, :update]
  resources :dashboards, only: [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
