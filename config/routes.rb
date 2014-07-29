Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]

  resources :users, only: [:new, :create, :edit, :update] do 
    resources :thoughts, only: [:create, :destroy]
    resources :photos, only: [:index]
    resources :friendships, only: [:create, :destroy]
  end

  resources :messages, only: [:create]
  resources :friendships, only: [] do
    resource :accepted_friendship, only: [:create]
  end
  resources :thoughts, only: [] do
    resources :comments, only: [:create]
  end
  resources :photos, only: [:create, :show] do
    resources :comments, only: [:create]
    resource :like, only: [:create, :destroy]
  end

  root to: "dashboards#show"

  get ":slug", to: "users#show", as: :user_show
end
