Rails.application.routes.draw do
  root "homepage#index"
  devise_for :users
  resources  :users
  resources  :posts
  resources  :categories
end
