Rails.application.routes.draw do
  
  get 'todos/index'
  get 'todos/new'
  get 'todos/edit'
  devise_for :users
end
