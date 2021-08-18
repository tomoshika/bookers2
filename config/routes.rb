Rails.application.routes.draw do
  devise_for :users
  
  root to: 'homes#top'
  get 'book/about' => 'homes#about'
  resources :books, only: [:new, :create, :index, :show, :edit, :destroy]
  resources :users, only: [:index, :show, :edit, :update]
end
