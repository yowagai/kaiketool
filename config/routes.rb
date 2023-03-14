Rails.application.routes.draw do
  devise_for :users
  root to: 'kaiketools#index'
  resources :kaiketools
  get "speech-to-text", to: "speech_to_text#index"
end
