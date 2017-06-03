Rails.application.routes.draw do
  devise_for :users

  root :to => 'home#index'

  resources :units do
    resources :parts
  end
  resources :stats, :only => [:index]

  resources :departments do
    resources :parts
  end

  resources :positions

  # post '/', to: 'home#show', as: 'show'


end
