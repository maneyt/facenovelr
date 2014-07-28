Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show] do
<<<<<<< HEAD
    resources :friendships, only: [:create, :destroy]
  end
  resources :friendships, only: [] do
    resource :accepted_friendship, only: [:create]
  end
  resources :thoughts, only: [:create, :destroy]
  resources :users, only: [:new, :create, :show] do 
    resources :photos, only: [:index]
  end
  resources :photos, only: [:create]
=======
    resources :thoughts, only: [:create, :destroy]
  end
>>>>>>> 8209ad7... Users now have individual profile pages
  root to: "dashboards#show"
end
