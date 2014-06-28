Rails.application.routes.draw do
  root :to => "sessions#new"

  resources :users do
    resources :challenges
    resources :daily_workouts, only: [:new, :edit, :update]
  end

  resources :sessions, only: [:new, :create, :destroy]

 	get   '/login', :to => 'sessions#new', :as => :login
 	get 	'/logout', :to => 'session#destroy'
 	get '/users/:id/sync', :to => 'users#show'
	match '/auth/:provider/callback', :to => 'sessions#create', via: [:get, :post]
	match '/auth/failure', :to => 'sessions#failure', via: [:get]

	AjaxExample::Application.routes.draw do
  	resources :products do
    	get "delete"
  	end
  	root to: "products#index"
	end

end