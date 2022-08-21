Rails.application.routes.draw do
  root to:'home#index'
  
  resources :to_dos do
    post 'export', on: :member
  end
  
  mount LetterOpenerWeb::Engine, at: "/emails" if Rails.env.development?
end
