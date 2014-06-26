Rails.application.routes.draw do
  root :to => "sessions#new"

  resources :users do
    resources :challenges
    resources :daily_workouts, only: [:new, :edit, :update]
  end

  resources :sessions, only: [:new, :create, :destroy]

 	get   '/login', :to => 'sessions#new', :as => :login
 	get 	'/logout', :to => 'session#destroy'
	match '/auth/:provider/callback', :to => 'sessions#create', via: [:get, :post]
	match '/auth/failure', :to => 'sessions#failure', via: [:get]
end
