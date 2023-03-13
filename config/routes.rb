Rails.application.routes.draw do
  devise_for :users
  root to: 'kaiketools#index'
  resources :kaiketools
end
