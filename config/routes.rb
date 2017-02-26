Rails.application.routes.draw do
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
