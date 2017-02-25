Rails.application.routes.draw do
  get 'contacts/contact'

  get 'blogs/blog'

  get 'mains/about'

  get 'mains/expo'

  get 'mains/index'

  get 'mains/media'

  get 'archives/archive'

  root 'mains#index'
  resources :archives
  resources :contacts
end
