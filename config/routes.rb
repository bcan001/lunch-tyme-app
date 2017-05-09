Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :restaurants

  # get 'restaurants/reviews' => 'restaurants#reviews', :as => :restaurant_reviews
  # get 'restaurants/about' => 'restaurants#about', :as => :restaurant_about


  resources :categories

  root 'restaurants#index'
  resources :maps, only: [:index]
end
