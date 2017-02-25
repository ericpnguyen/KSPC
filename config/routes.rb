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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
