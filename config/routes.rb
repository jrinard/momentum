Rails.application.routes.draw do
  devise_for :users
  # devise_for :users, controllers: {registrations: 'registrations'}
  resources :users, :only => [:index, :show, :edit, :update, :destroy]

  root :to => 'home#index'

  resources :units do
    resources :parts
  end
  resources :stats, :only => [:index]

  resources :departments
  get '/serve', to: 'departments#serve', as: 'serve'
  resources :events
  resources :revents
  resources :positions
  resources :spectators

  get '/checkins', to: 'events#checkins', as: 'checkins'
  get '/checkin/:id', to: 'events#checkin', as: 'checkin'

  # post '/', to: 'home#show', as: 'show'

end
