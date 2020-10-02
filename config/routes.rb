Rails.application.routes.draw do
  devise_for :users
  root to: "people#index"
  resources :people do
    collection do
      get 'search'
    end
  end
end
