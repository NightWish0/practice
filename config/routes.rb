Rails.application.routes.draw do
  get 'welcome/index'
  get 'parking', to: 'welcome#parking'
  get 'contact', to: 'welcome#contact'

  resources :emails

  namespace :admin do

    resources :emails

  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
