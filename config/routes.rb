Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: { :omniauth_callbacks => 'omniauth_callbacks' }
  root 'static_pages#home'
  get 'static_pages/show'
end
