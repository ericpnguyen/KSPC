Rails.application.routes.draw do
  get 'mains/admin'

  devise_for :admins
  get 'blogs/blog'

  get 'mains/index'

  get 'mains/media'

  get '/admin' => 'mains#admin'

  root 'mains#index'

  resources :abouts
  resources :archives
  resources :expos
  resources :contacts
end
