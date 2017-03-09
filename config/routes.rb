Rails.application.routes.draw do
  devise_for :admins
  get 'mains/admin'

  get 'mains/index'

  get 'mains/media'

  get '/admin' => 'mains#admin'

  root 'mains#index'

  resources :abouts
  resources :archives
  resources :expos
  resources :blogs
  resources :contacts
end
