Rails.application.routes.draw do
  get 'contacts/index'

  get 'contacts/new'

  get 'contacts/create'

  get 'contacts/show'

  get 'archives/index'

  get 'archives/new'

  get 'archives/show'

  get 'contacts/contact'

  get 'blogs/blog'

  get 'mains/about'

  get 'mains/expo'

  get 'mains/index'

  get 'mains/media'

  root 'mains#index'
  resources :archives
  resources :contacts
end
