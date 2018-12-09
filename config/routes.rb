Rails.application.routes.draw do
  
  get 'home/front'
  get 'todos/index'
  get 'todos/new'
  get 'todos/edit'
  devise_for :users

  root 'home#front'

  resources :users do
    resources :todos
  end
end
