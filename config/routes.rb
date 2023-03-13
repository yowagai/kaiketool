Rails.application.routes.draw do
  root to: 'kaiketools#index'
  resources :kaiketools
end
