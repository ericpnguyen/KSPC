Rails.application.routes.draw do
  devise_for :admins
  get 'mains/admin'

  get 'blogs/blog'

  get 'mains/index'

  get 'mains/media'

  get '/admin' => 'mains#admin'

  get '/archive(.:format)', to: 'archives#index', as: 'archives'
  post '/archives(.:format)', to: 'archives#create', as: 'create_archive'

  root 'mains#index'

  resources :abouts
  resources :archives
  resources :expos
  resources :contacts
end
