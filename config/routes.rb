Rails.application.routes.draw do
  root 'static_pages#home'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: 'static_pages#home'
  delete 'logout', to: 'sessions#destroy'
  resources :sessions, only: %i[destroy]
  resources :users, only: %i[show] do
    collection do
      post 'join_club'
    end
  end
  resources :clubs do
    resources :invitations, only: %i[show create]
  end
end
