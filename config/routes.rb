Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'home#index'  
  devise_for :users
  resources :questions do
    resources :answers
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  
  patch 'questions/:id/close', to: 'questions#close', as: 'close_question'

  resources :users
  namespace :admin do
    resources :users
  end


end




