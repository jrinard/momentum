Rails.application.routes.draw do
  resources :revents
  devise_for :users

  root :to => 'home#index'

  resources :units do
    resources :parts
  end
  resources :stats, :only => [:index]

  resources :departments
  resources :revents
  resources :positions
  resources :spectators

  get '/checkins', to: 'events#checkins', as: 'checkins'
  get '/checkin/:id', to: 'events#checkin', as: 'checkin'

  # post '/', to: 'home#show', as: 'show'


end
