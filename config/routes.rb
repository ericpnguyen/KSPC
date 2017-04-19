Rails.application.routes.draw do
  resources :subscribers
  devise_for :admins
  get 'mains/admin'

  get 'mains/index'

  get 'mains/media'

  get '/admin' => 'mains#admin'

  get '/archive(.:format)', to: 'archives#index', as: 'archives'
  post '/archives(.:format)', to: 'archives#create', as: 'create_archive'

  get '/blogs(.:format)', to: 'blogs#index', as: 'blogs'
  post '/blogs(.:format)', to: 'blogs#create', as: 'create_blog'

  root 'mains#index'
  resources :program_schedule
  resources :abouts
  resources :archives
  resources :expos
  resources :blogs
  resources :contacts
  resources :emails, only: [:new, :create]
  resources :subscribers
end
