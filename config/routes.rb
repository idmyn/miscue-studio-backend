Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # resources :mistakes
      # resources :story_words
      # resources :readings
      # resources :words
      # resources :stories
      resources :students, only: [:index]
      # resources :teachers
    end
  end
end
