Rails.application.routes.draw do

  get 'answers/create'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'home#index'  

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?  

  devise_for :users

  resources :users
  resources :questions 


end




