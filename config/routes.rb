Rails.application.routes.draw do
  devise_for :users
  root to: 'kaiketools#index'
  resources :kaiketools
  resources :speech_to_text do
    collection do
      get 'search'
    end
  end
  resources :google_custom_search do
    collection do
      get 'search'
    end
  end
  # get "speech-to-text", to: "speech_to_text#index"
  # get '/google_custom_search', to: 'google_custom_search#search'
end
