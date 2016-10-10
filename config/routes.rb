Rails.application.routes.draw do
  root 'static_pages#home'
  get 'about' =>      'static_pages#about'
  get 'news' =>       'static_pages#news'
  
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
