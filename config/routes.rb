Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # resources :mistakes
      # resources :story_words
      # resources :readings
      # resources :words
      resources :students, only: [:index, :show]
      resources :teachers, only: [:create, :show]
      resources :stories, only: [:index, :show]
      post "/login", to: "teachers#login"
      get "/validate", to: "teachers#validate"
    end
  end
end
