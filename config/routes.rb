Rails.application.routes.draw do
  root 'static_pages#home'
  get 'about' =>      'static_pages#about'
  get 'contact' =>    'static_pages#contact'
  get 'news' =>       'static_pages#news'
  get 'advertise' =>  'static_pages#advertise'
  
  get 'signup' =>     'users#new'
  resources :users
  
  resources :forums do
    resources :comments
  end
  
  delete 'logout' =>     'sessions#destroy'
  resources :sessions, only: [:new, :create] 
end
