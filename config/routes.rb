Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  devise_for :admins   
  root 'home#index'   

  resources :questions do
    resources :answers
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  
  patch 'questions/:id/close', to: 'questions#close', as: 'close_question'

  resources :users
  
  namespace :admin do
    resources :users, only: [:index, :show]
  end

  resources :favorites, only: [:create, :destroy]

  resources :useful_answers, only: [:create, :destroy]

end




