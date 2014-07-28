Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
<<<<<<< HEAD
  resources :thoughts, only: [:create, :destroy]
=======
  resources :photos, only: [:create]
>>>>>>> Add photo table, users can upload photos via paperclip
  root to: "dashboards#show"
end
