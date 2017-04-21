Rails.application.routes.draw do
  get 'charities/fourloveofbaja'

  root 'static_pages#home'

  
  get 'charities/4loveofbaja'
  get 'news' =>       'static_pages#news'
  get '4loveofbaja' => 'charities/4loveofbaja'

  get 'signup' =>     'users#new'
  resources :users

  resources :bars
  resources :realestates
  resources :services
  resources :activities
  resources :fishings
  resources :advertises
  resources :contacts

  resources :forums do
    resources :comments
  end

  delete 'logout' =>     'sessions#destroy'
  resources :sessions, only: [:new, :create]
end
