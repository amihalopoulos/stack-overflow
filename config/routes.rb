Rails.application.routes.draw do

  root 'questions#index'

  resources :users

  resources :questions do
    resources :answers, only: [:new, :edit, :delete]
  end
  
  resources :responses
end
