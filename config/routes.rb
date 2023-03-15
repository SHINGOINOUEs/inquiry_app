Rails.application.routes.draw do
  devise_for :users

  resources :questions

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end


