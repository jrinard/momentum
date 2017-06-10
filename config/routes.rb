Rails.application.routes.draw do
  devise_for :users

  root :to => 'home#index'

  resources :units do
    resources :parts
  end
  resources :stats, :only => [:index]

  resources :departments
  resources :events
  resources :positions
  resources :spectators

  get '/checkins', to: 'events#checkins', as: 'checkins'
  get '/checkin/:id', to: 'events#checkin', as: 'checkin'

  # post '/', to: 'home#show', as: 'show'


end
