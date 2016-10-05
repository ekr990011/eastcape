Rails.application.routes.draw do
  root 'static_pages#home'
  get 'about' =>      'static_pages#about'
  get 'news' =>       'static_pages#news'
  get 'fishing' =>    'static_pages#fishing'
  
  get 'signup' =>     'users#new'
  resources :users
  
  resources :advertises
  
  resources :contacts
  
  resources :forums do
    resources :comments
  end
  
  delete 'logout' =>     'sessions#destroy'
  resources :sessions, only: [:new, :create] 
end
