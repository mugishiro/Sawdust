Rails.application.routes.draw do
  devise_for :users, controllers: { :omniauth_callbacks => "omniauth_callbacks" }
  root 'home#index'
  get 'home', to: 'home#timeline'
  post 'tweet', to: 'home#tweet'
end
