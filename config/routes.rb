Rails.application.routes.draw do
  get 'welcome/index'
  get 'parking', to: 'parking#index'
  get 'contact', to: 'parking#index'

  resources :emails

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
