Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  resources :thoughts, only: [:create]
  root to: "dashboards#show"
end
