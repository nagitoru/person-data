Rails.application.routes.draw do
  get 'persons/index'
  devise_for :users
  root to: "persons#index"
end
