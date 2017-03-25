Rails.application.routes.draw do
  resources :subscribers
  devise_for :admins
  get 'mains/admin'

  get 'mains/index'

  get 'mains/media'

  get '/admin' => 'mains#admin'

  root 'mains#index'

  resources :abouts
  resources :archives
  resources :expos
  resources :blogs do
    resources :comments
  end
  resources :contacts
  resources :subscribers
end
