Rails.application.routes.draw do
  get 'contacts/index'

  get 'contacts/new'

  get 'contacts/create'

  get 'contacts/show'

  get 'archives/about'

  get 'archives/blog'

  get 'archives/expo'

  get 'archives/media'

  get 'archives/contact'

  root 'archives#index'
  resources :archives
  resources :contacts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
