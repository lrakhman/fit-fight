Rails.application.routes.draw do
  root :to => "sessions#new"

  resources :users do
    resources :challenges
    resources :daily_workouts, only: [:new, :edit, :update]
  end

  resources :sessions, only: [:new, :create, :destroy]

  get '/users/:id/workouts/new', to: 'users#workout'
end
