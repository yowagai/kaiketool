Rails.application.routes.draw do
  devise_for :users
  root to: 'kaiketools#index'
  get "kaiketools", to: "kaiketools#index"
  resources :search_histories do
    collection do
      get 'search'
    end
    resources :comments, only: :create
  end
  resources :speech_to_text, only: :index do
    collection do
      get 'search'
    end
  end
  resources :users, only: :show
end
