Rails.application.routes.draw do
  root 'static_pages#home'
  get 'about' =>      'static_pages#about'
  get 'contact' =>    'static_pages#contact'
  get 'news' =>       'static_pages#news'
  get 'advertise' =>  'static_pages#advertise'
  
  resources :forums do
    resources :comments
  end
end
