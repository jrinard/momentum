Rails.application.routes.draw do
  devise_for :users

  root :to => 'home#index'
  # resources :about, :only => [:index]
  # resources :home
  resources :units do
    resources :parts
  end

    post '/', to: 'home#show', as: 'show'

end
