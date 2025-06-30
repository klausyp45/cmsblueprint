Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  
  resources :posts do
    resources :comments, only: [:create, :destroy]
    member do
      post "like", to: "likes#create"
      delete "unlike", to: "likes#destroy"
    end
  end

  resources :comments, only: [] do
    resources :comments, only: [:create, :destroy]
  end

  resources :likes, only: [] do
    collection do
      post ':likeable_type/:likeable_id', to: 'likes#create', as: :like
      delete ':likeable_type/:likeable_id', to: 'likes#destroy', as: :unlike
    end
  end
  
  namespace :admin do
    resources :posts
    resources :comments
    resources :likes
    resources :users
    root to: "posts#index"
  end
end