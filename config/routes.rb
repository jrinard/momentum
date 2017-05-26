Rails.application.routes.draw do
  devise_for :users

  root :to => 'home#index'
  # resources :about, :only => [:index]
  # resources :home
  resources :units do
    resources :parts
  end

end
