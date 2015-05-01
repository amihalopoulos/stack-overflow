Rails.application.routes.draw do

  root 'questions#index'

  resources :users

  resources :questions do
    resources :answers, only: [:new, :create, :edit, :destroy]
  end

  resources :responses

  get 'signin' => 'auth#signin_form'
  post 'signin' => 'auth#signin'
  get 'signout' => 'auth#signout'
end
