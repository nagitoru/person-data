Rails.application.routes.draw do
  devise_for :users
  root to: "people#index"
  resources :people
end
