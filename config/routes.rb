Rails.application.routes.draw do
  devise_for :users
  root to: "recipes#index"
  get "recipes/search"
  resources :recipes do
    resources :comments, only: :create
    collection do
      get "search"
    end
  end
  resources :top, only: :index
end
