Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  root to: 'home#index'
  resources :users
  resources :profiles

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  #API
  namespace :zemoga_portfolio_api, defaults: { format: :json }  do
    get 'user_info'
    post 'modify_user_info'
  end
end
