Rails.application.routes.draw do
  
  root "homepage#index"

  devise_for :users
end
