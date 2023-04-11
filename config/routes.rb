Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  root to: 'home#top'

  get 'home/sample', to: 'home#sample'
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  resources :users, only: %i[new create update destroy]
  resources :advice_materials, only: %i[new create edit update]
  resources :hairs_features, only: %i[new create edit update]
  resource :user_information, only: %i[show edit update]
  resources :weather_forecasts, only: %i[new create update show]
  resources :password_resets, only: %i[new create edit update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
