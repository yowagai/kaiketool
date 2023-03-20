Rails.application.routes.draw do
  devise_for :users
  root to: 'kaiketools#index'
  resources :kaiketools
  resources :speech_to_text, only: :index do
    collection do
      get 'search'
    end
  end
  resources :google_custom_search, only: :index do
    collection do
      get 'search'
    end
  end
  resources :users, only: :show
  # get "speech-to-text", to: "speech_to_text#index"
  # get '/google_custom_search', to: 'google_custom_search#search'
end
