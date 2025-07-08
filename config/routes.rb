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

  resources :pages, only: [:show] do
    collection do
      get 'about', to: 'pages#about'
      get 'contact', to: 'pages#contact'
      get 'privacy', to: 'pages#privacy'
      get 'terms', to: 'pages#terms'
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
    resources :pages
    resources :users
    root to: "posts#index" # or any dashboard you prefer
  end
end