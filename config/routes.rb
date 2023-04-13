Rails.application.routes.draw do
  get 'answers/create'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'home#index'  
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?  

  devise_for :users

  resources :users
  resources :questions do
    resources :favorites, only: [:create, :destroy]
    resources :useful_answers, only: [:create, :destroy]    
  end

end
