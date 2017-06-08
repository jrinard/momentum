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

  # post '/', to: 'home#show', as: 'show'


end
