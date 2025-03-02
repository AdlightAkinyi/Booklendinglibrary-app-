Rails.application.routes.draw do
  devise_for :users
  root "books#index"
  resources :books, only: [:index, :show] do
    member do
      post :borrow
      post :return
    end
  end
  resources :users, only: [:show]
end

