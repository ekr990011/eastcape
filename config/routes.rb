Rails.application.routes.draw do
  root 'static_pages#home'
  get 'about' =>      'static_pages#about'
  get 'activities' => 'layouts#activities'
  get 'forum' =>      'static_pages#forum'
  get 'news' =>       'static_pages#news'
end
