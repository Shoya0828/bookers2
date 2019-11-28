Rails.application.routes.draw do

  
  devise_for :users

  root 'top#top'
  get 'home/about' => 'top#about'
  resources :books

  resources :users, only: [:index, :show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
