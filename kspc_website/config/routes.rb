Rails.application.routes.draw do
  root 'archives#index'
  resources :archives

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
