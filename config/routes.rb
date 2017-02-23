Rails.application.routes.draw do
  get 'archives/about'

  get 'archives/blog'

  get 'archives/expo'

  get 'archives/media'

  get 'archives/contact'

  root 'archives#index'
  resources :archives

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
