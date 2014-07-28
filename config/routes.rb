Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]

  resources :friendships, only: [] do
    resource :accepted_friendship, only: [:create]
  end
  resources :users, only: [:new, :create] do 
    resources :thoughts, only: [:create, :destroy]
    resources :photos, only: [:index]
    resources :friendships, only: [:create, :destroy]
  end
  resources :photos, only: [:create]
  root to: "dashboards#show"

  get ":slug", to: "users#show", as: :user
end
