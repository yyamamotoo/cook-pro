Rails.application.routes.draw do
  devise_for :users
  root to: "recipes#index"
  resources :recipes
  resources :top, only: :index
end
