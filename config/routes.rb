Rails.application.routes.draw do

  root 'kittens#index'
  get 'kitten/new',         to: 'kittens#new'
  post 'kittens',           to: 'kittens#create'
  get 'kittens/:id',        to: 'kittens#show',     as: 'kitten'
  get 'kittens',            to: 'kittens#index'
  get 'kittens/:id/edit',   to: 'kittens#edit',     as: 'kitten_edit'
  delete 'kittens/:id',     to: 'kittens#destroy'
  put 'kittens/:id',        to: 'kittens#update'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
