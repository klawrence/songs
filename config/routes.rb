Rails.application.routes.draw do
  root to: 'pages#home'
  get '/home', to: 'pages#home'

  resources :artists do
    resources :tracks
  end

  resources :wordclouds
end
