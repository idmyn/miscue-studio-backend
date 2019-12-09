Rails.application.routes.draw do
  resources :mistakes
  resources :story_words
  resources :readings
  resources :words
  resources :stories
  resources :students
  resources :teachers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
