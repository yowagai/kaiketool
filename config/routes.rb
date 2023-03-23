Rails.application.routes.draw do
  devise_for :users
  root to: 'kaiketools#index'
  resources :kaiketools do
    collection do
      get 'search'
    end
  end
  resources :search_histories do
    collection do
      get 'search'
    end
  end
  resources :speech_to_text, only: :index do
    collection do
      get 'search'
    end
  end
  resources :google_custom_search, only: [:index, :new] do
    collection do
      get 'search'
    end
  end
  resources :users, only: :show

  post '/google_custom_search/search', to: 'google_custom_search#search'
  # get "speech-to-text", to: "speech_to_text#index"
  # get '/google_custom_search', to: 'google_custom_search#search'
end
