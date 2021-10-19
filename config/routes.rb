Rails.application.routes.draw do
  # API routes
  namespace :api do
    namespace :v1 do
      resources :users do
        # Rendering users' posts
        resources :posts
      end
      # Only Post rendering
      resources :posts
    end
  end

  # Simple routes
  root "homepage#index"
  devise_for :users
  resources  :users
  resources  :posts
  resources  :categories
end
