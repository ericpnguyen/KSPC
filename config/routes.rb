Rails.application.routes.draw do
  get 'contacts/contact'

  get 'blogs/blog'

  get 'mains/index'

  get 'mains/media'

  root 'mains#index'

  resources :abouts
  resources :archives
  resources :expos
  resources :contacts
end
