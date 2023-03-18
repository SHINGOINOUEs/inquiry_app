Rails.application.routes.draw do
  root 'home#index'  
  devise_for :users
  resources :questions do
    resources :answers
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end


