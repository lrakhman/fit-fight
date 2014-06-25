Rails.application.routes.draw do
  root :to => "sessions#new"

  resources :users do
    resources :challenges
  end

  resources :sessions, only: [:new, :create, :destroy]

  get '/users/:id/workouts/new', to: 'users#workout'
end
