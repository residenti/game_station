Rails.application.routes.draw do
  root 'static_pages#home'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: 'static_pages#home'
  delete 'logout', to: 'sessions#destroy'
  resources :sessions, only: %i[destroy]
  resources :users, only: %i[show]
  resources :clubs do
    resources :invitations, param: :token, only: %i[show create] do
      post 'accept', on: :member
    end
  end
end
