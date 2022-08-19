Rails.application.routes.draw do
  root to:'home#index'
  resources :to_dos
  mount LetterOpenerWeb::Engine, at: "/emails" if Rails.env.development?
end
